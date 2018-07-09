//
//  FavoriteProgramListViewModel.swift
//  genesisvision-ios
//
//  Created by George on 07/05/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

final class FavoriteProgramListViewModel: ProgramListViewModelProtocol {
   // MARK: - Variables
    var title: String = "Favorite Programs"

    internal var sections: [SectionType] = [.header, .programList]
    
    var router: ProgramListRouterProtocol!
    
    private weak var reloadDataProtocol: ReloadDataProtocol?
    
    var canFetchMoreResults = true
    var dataType: DataType = .api
    var programsCount: String = ""
    var equityChartLength = Constants.Api.equityChartLength
    var skip = 0 {
        didSet {
            filter?.skip = skip
        }
    }
    var take = Constants.Api.take
    var totalCount = 0 {
        didSet {
            programsCount = "\(totalCount) programs"
        }
    }
    
    var headerTitle = "PROGRAMS"
    
    var bottomViewType: BottomViewType {
        return .sort
    }
    
    public private(set) var needToRefresh = false
    var filter: InvestmentProgramsFilter?
    internal var sorting: InvestmentProgramsFilter.Sorting = Constants.Sorting.programListDefault
    
    var searchText = "" {
        didSet {
            filter?.name = searchText
        }
    }
    var programViewModels = [ProgramTableViewCellViewModel]()
    
    var sortingKeys: [InvestmentProgramsFilter.Sorting] = [.byProfitDesc, .byProfitAsc,
                                                           .byLevelDesc, .byLevelAsc,
                                                           .byBalanceDesc, .byBalanceDesc,
                                                           .byOrdersDesc, .byOrdersAsc,
                                                           .byEndOfPeriodDesc, .byEndOfPeriodAsc,
                                                           .byTitleDesc, .byTitleAsc]
    
    var sortingValues: [String] = ["profit ⇣", "profit ⇡",
                                   "level ⇣", "level ⇡",
                                   "balance ⇣", "balance ⇡",
                                   "orders ⇣", "orders ⇡",
                                   "end of period ⇣",
                                   "end of period ⇡",
                                   "title ⇣", "title ⇡"]
    
    struct SortingList {
        var sortingValue: String
        var sortingKey: InvestmentProgramsFilter.Sorting
    }
    
    var sortingList: [SortingList] {
        return sortingValues.enumerated().map { (index, element) in
            return SortingList(sortingValue: element, sortingKey: sortingKeys[index])
        }
    }
    
    // MARK: - Init
    init(withRouter router: FavoriteProgramListRouter, reloadDataProtocol: ReloadDataProtocol?) {
        self.router = router
        self.reloadDataProtocol = reloadDataProtocol
        
        filter = InvestmentProgramsFilter(managerId: nil,
                                          brokerId: nil,
                                          brokerTradeServerId: nil,
                                          investMaxAmountFrom: nil,
                                          investMaxAmountTo: nil,
                                          sorting: sorting,
                                          name: searchText,
                                          levelMin: nil,
                                          levelMax: nil,
                                          balanceUsdMin: nil,
                                          balanceUsdMax: nil,
                                          profitAvgMin: nil,
                                          profitAvgMax: nil,
                                          profitTotalMin: nil,
                                          profitTotalMax: nil,
                                          profitTotalPercentMin: nil,
                                          profitTotalPercentMax: nil,
                                          profitAvgPercentMin: nil,
                                          profitAvgPercentMax: nil,
                                          profitTotalChange: nil,
                                          periodMin: nil,
                                          periodMax: nil,
                                          showActivePrograms: nil,
                                          equityChartLength: equityChartLength,
                                          showMyFavorites: true,
                                          roundNumber: nil,
                                          skip: skip,
                                          take: take)
        
        NotificationCenter.default.addObserver(self, selector: #selector(programFavoriteStateChangeNotification(notification:)), name: .programFavoriteStateChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .programFavoriteStateChange, object: nil)
    }
    
    // MARK: - Public methods
    func changeFavorite(value: Bool, investmentProgramId: String, request: Bool = false, completion: @escaping CompletionBlock) {
        guard request else {
            guard let model = model(at: investmentProgramId) as? ProgramTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
            model.investmentProgram.isFavorite = value
            
            if !value, let i = programViewModels.index(where: { $0.investmentProgram.id?.uuidString == investmentProgramId }) {
                programViewModels.remove(at: i)
                totalCount = programViewModels.count
            }
            
            completion(.success)
            return
        }
        
        ProgramDataProvider.programFavorites(isFavorite: !value, investmentProgramId: investmentProgramId) { [weak self] (result) in
            switch result {
            case .success:
                guard let model = self?.model(at: investmentProgramId) as? ProgramTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
                model.investmentProgram.isFavorite = value
                value ? completion(.success) : self?.refresh(completion: completion)
            case .failure(let errorType):
                print(errorType)
                completion(result)
            }
        }
    }
    
    // MARK: - Private methods
    @objc private func programFavoriteStateChangeNotification(notification: Notification) {
        if let isFavorite: Bool = notification.userInfo?["isFavorite"] as? Bool, let investmentProgramId = notification.userInfo?["investmentProgramId"] as? String {
            
            guard !isFavorite else {
                refresh { [weak self] (result) in
                    self?.reloadDataProtocol?.didReloadData()
                }
                
                return
            }
            
            changeFavorite(value: isFavorite, investmentProgramId: investmentProgramId) { [weak self] (result) in
                self?.reloadDataProtocol?.didReloadData()
            }
        }
    }
}

// MARK: - Fetch
extension FavoriteProgramListViewModel {
    // MARK: - Public methods
    func fetch(completion: @escaping CompletionBlock) {
        fetch({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalProgramCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    func fetchMore() {
        guard skip < totalCount else { return }
        
        canFetchMoreResults = false
        fetch({ [weak self] (totalCount, viewModels) in
            var allViewModels = self?.programViewModels ?? [ProgramTableViewCellViewModel]()
            
            viewModels.forEach({ (viewModel) in
                allViewModels.append(viewModel)
            })
            
            self?.updateFetchedData(totalProgramCount: totalCount, allViewModels)
            }, completionError: { (result) in
                switch result {
                case .success:
                    break
                case .failure(let errorType):
                    ErrorHandler.handleError(with: errorType)
                }
        })
    }
    
    func refresh(completion: @escaping CompletionBlock) {
        needToRefresh = false
        skip = 0
        
        fetch({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalProgramCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    private func updateFetchedData(totalProgramCount: Int, _ viewModels: [ProgramTableViewCellViewModel]) {
        self.programViewModels = viewModels
        self.totalCount = totalProgramCount
        self.skip += self.take
        self.canFetchMoreResults = true
        self.reloadDataProtocol?.didReloadData()
    }

    // MARK: - Private methods
    private func fetch(_ completionSuccess: @escaping (_ totalCount: Int, _ viewModels: [ProgramTableViewCellViewModel]) -> Void, completionError: @escaping CompletionBlock) {
        switch dataType {
        case .api:
            guard let filter = filter else { return completionError(.failure(errorType: .apiError(message: nil))) }
            ProgramDataProvider.getPrograms(with: filter, completion: { [weak self] (investmentProgramsViewModel) in
                guard let investmentPrograms = investmentProgramsViewModel else { return completionError(.failure(errorType: .apiError(message: nil))) }
                
                var programViewModels = [ProgramTableViewCellViewModel]()
                
                let totalCount = investmentPrograms.total ?? 0
                
                investmentPrograms.investmentPrograms?.forEach({ (investmentProgram) in
                    guard let favoriteProgramListRouter: FavoriteProgramListRouter = self?.router as? FavoriteProgramListRouter else { return completionError(.failure(errorType: .apiError(message: nil))) }
                    
                    let programTableViewCellViewModel = ProgramTableViewCellViewModel(investmentProgram: investmentProgram, delegate: favoriteProgramListRouter.favoriteProgramListViewController)
                    programViewModels.append(programTableViewCellViewModel)
                })
                
                completionSuccess(totalCount, programViewModels)
                completionError(.success)
                }, errorCompletion: completionError)
        case .fake:
            fakeViewModels { (programViewModels) in
                completionSuccess(programViewModels.count, programViewModels)
                completionError(.success)
            }
        }
    }
}