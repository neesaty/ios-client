//
//  WalletControllerViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 26.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

final class WalletControllerViewModel {
    
    enum SectionType {
        case header
        case transactions
    }
    
    // MARK: - Variables
    var title: String = "Wallet"
    
    private var sections: [SectionType] = [.header, .transactions]

    private var router: WalletRouter!
    private var transactions = [WalletTransactionTableViewCellViewModel]()
    
    private var balance: Double = 0.0
    private var currency: String = Constants.currency
    
    var dataType: DataType = .api
    var skip = 0            //offset
    var totalCount = 0      //total count of programs
    
    /// Return view models for registration cell Nib files
    static var cellModelsForRegistration: [CellViewAnyModel.Type] {
        return [WalletHeaderTableViewCellViewModel.self,
                WalletTransactionTableViewCellViewModel.self]
    }
    
    /// Return view models for registration header/footer Nib files
    static var viewModelsForRegistration: [UITableViewHeaderFooterView.Type] {
        return [DefaultTableHeaderView.self]
    }
    
    // MARK: - Init
    init(withRouter router: WalletRouter) {
        self.router = router
        
        setup()
    }
    
    // MARK: - Public methods
    // MARK: - Navigation
    func withdraw() {
        router.show(routeType: .withdraw)
    }
    
    func deposit() {
        router.show(routeType: .deposit)
    }
    
    // MARK: - Data methods
    func getBalance() -> Double {
        return balance
    }
    
    func fetchBalance(completion: @escaping CompletionBlock) {
        AuthManager.getBalance { [weak self] (value) in
            self?.balance = value
            completion(.success)
        }
    }
    
    /// Fetch transactions from API -> Save fetched data -> Return CompletionBlock
    func fetchTransactions(completion: @escaping CompletionBlock) {
        switch dataType {
        case .api:
            fetchTransactions({ [weak self] (totalCount, viewModels) in
                self?.updateFetchedData(totalCount: totalCount, viewModels)
                completion(.success)
                }, completionError: completion)
        case .fake:
            fakeTransactions(completion: { [weak self] (viewModels) in
                self?.updateFetchedData(totalCount: viewModels.count, viewModels)
                completion(.success)
            })
        }
        
    }
    
    /// Fetch more transactions from API -> Save fetched data -> Return CompletionBlock
    func fetchMoreTransactions(completion: @escaping CompletionBlock) {
        if skip >= totalCount {
            return completion(.failure(reason: nil))
        }
        
        skip += Constants.Api.take
        
        fetchTransactions({ [weak self] (totalCount, viewModels) in
            var allViewModels = self?.transactions ?? [WalletTransactionTableViewCellViewModel]()
            
            viewModels.forEach({ (viewModel) in
                allViewModels.append(viewModel)
            })
            
            self?.updateFetchedData(totalCount: totalCount, allViewModels)
            }, completionError: completion)
    }
    
    /// Fetch transactions from API -> Save fetched data -> Return CompletionBlock
    func refresh(completion: @escaping CompletionBlock) {
        skip = 0
        
        fetchTransactions({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    // MARK: - TableView
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .transactions:
            return transactions.count
        }
    }
    
    func headerTitle(for section: Int) -> String? {
        switch sections[section] {
        case .transactions:
            return "Transactions"
        case .header:
            return nil
        }
    }
    
    func headerHeight(for section: Int) -> CGFloat {
        switch sections[section] {
        case .transactions:
            return 50.0
        case .header:
            return 0.0
        }
    }
    
    /// Get TableViewCellViewModel for IndexPath
    func model(at indexPath: IndexPath) -> CellViewAnyModel? {
        let type = sections[indexPath.section]
        switch type {
        case .header:
            return WalletHeaderTableViewCellViewModel(balance: balance, currency: currency)
        case .transactions:
            return transactions[indexPath.row]
        }
    }
    
    // MARK: - Private methods
    private func setup() {
        AuthManager.getBalance { [weak self] (value) in
            self?.balance = value
        }
    }
    
    private func fakeTransactions(completion: (_ transactionCellModels: [WalletTransactionTableViewCellViewModel]) -> Void) {
        var cellModels = [WalletTransactionTableViewCellViewModel]()
        
        for _ in 0..<Constants.TemplatesCounts.traders {
            cellModels.append(WalletTransactionTableViewCellViewModel(walletTransaction: WalletTransaction.templateModel))
        }
        
        completion(cellModels)
    }
    
    /// Update saved transactions (WalletTransactionTableViewCellViewModel)
    private func updateFetchedData(totalCount: Int, _ viewModels: [WalletTransactionTableViewCellViewModel]) {
        self.transactions = viewModels
        self.totalCount = totalCount
    }
    
    /// Save [WalletTransaction] and total -> Return [WalletTransactionTableViewCellViewModel] or error
    private func fetchTransactions(_ completionSuccess: @escaping (_ totalCount: Int, _ viewModels: [WalletTransactionTableViewCellViewModel]) -> Void, completionError: @escaping CompletionBlock) {
        
        let filter = TransactionsFilter(skip: skip, take: Constants.Api.take)
        
        WalletDataProvider.getWalletTransactions(filter: filter) { (transactionsViewModel) in
            guard transactionsViewModel != nil else {
                return ErrorHandler.handleApiError(error: nil, completion: completionError)
            }
            var viewModels = [WalletTransactionTableViewCellViewModel]()

            let totalCount = transactionsViewModel?.total ?? 0
            
            transactionsViewModel?.transactions?.forEach({ (walletTransaction) in
                let viewModel = WalletTransactionTableViewCellViewModel(walletTransaction: walletTransaction)
                viewModels.append(viewModel)
            })
            
            completionSuccess(totalCount, viewModels)
            completionError(.success)
        }
    }
}