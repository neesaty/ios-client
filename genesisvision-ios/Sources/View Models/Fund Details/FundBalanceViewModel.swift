//
//  FundBalanceViewModel.swift
//  genesisvision-ios
//
//  Created by George on 25/10/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UITableView

final class FundBalanceViewModel: ViewModelWithListProtocol, ViewModelWithFilter {
    var canPullToRefresh: Bool = true
    var viewModels: [CellViewAnyModel] = []
    
    enum SectionType {
        case chart
    }
    
    // MARK: - Variables
    var title: String = "Balance"
    var assetId: String?
    
    var router: Router!
    private weak var reloadDataProtocol: ReloadDataProtocol?
    private weak var chartViewProtocol: ChartViewProtocol?
    
    var dataType: DataType = .api

    var dateFrom: Date?
    var dateTo: Date?
    var maxPointCount: Int = ApiKeys.maxPoint
    
    private var fundBalanceChart: FundBalanceChart?
    
    private var sections: [SectionType] = [.chart]
    
    private var fundBalanceChartTableViewCellViewModel:   ProgramBalanceChartTableViewCellViewModel?
    
    // MARK: - Init
    init(withRouter router: Router, assetId: String, reloadDataProtocol: ReloadDataProtocol?) {
        self.router = router
        self.assetId = assetId
        self.reloadDataProtocol = reloadDataProtocol
        self.chartViewProtocol = router.currentController as? ChartViewProtocol
    }
    
    // MARK: - Public methods
    func getSelectedFundBalanceChartElement(_ date: Date) -> BalanceChartPoint? {
//        if let result = fundBalanceChart?.chart?.first(where: { $0.date == date }) {
//            return result
//        }
        
        return nil
    }
}

// MARK: - TableView
extension FundBalanceViewModel {
    // MARK: - Public methods
    /// Return view models for registration cell Nib files
    var cellModelsForRegistration: [CellViewAnyModel.Type] {
        return [FundBalanceChartTableViewCellViewModel.self]
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
}

// MARK: - Fetch
extension FundBalanceViewModel {
    // MARK: - Public methods
    func fetch(completion: @escaping CompletionBlock) {
        fetch(completion)
    }
    
    func refresh(completion: @escaping CompletionBlock) {
        fetch(completion)
    }
    
    /// Get TableViewCellViewModel for IndexPath
    func model(for indexPath: IndexPath) -> CellViewAnyModel? {
        guard let fundBalanceChart = fundBalanceChart else { return nil }
        
        let fundBalanceChartTableViewCellViewModel =  FundBalanceChartTableViewCellViewModel(fundBalanceChart: fundBalanceChart, chartViewProtocol: self.chartViewProtocol)
        
        return fundBalanceChartTableViewCellViewModel
    }
    
    // MARK: - Private methods
    private func fetch(_ completion: @escaping CompletionBlock) {
        switch dataType {
        case .api:
            guard let assetId = assetId else { return completion(.failure(errorType: .apiError(message: nil))) }
            FundsDataProvider.getBalanceChart(with: assetId, dateFrom: dateFrom, dateTo: dateTo, maxPointCount: maxPointCount, currencyType: getPlatformCurrencyType(), completion: { [weak self] (viewModel) in
                guard viewModel != nil else {
                    return ErrorHandler.handleApiError(error: nil, completion: completion)
                }
                
                self?.fundBalanceChart = viewModel
                self?.reloadDataProtocol?.didReloadData()
                completion(.success)
            }, errorCompletion: completion)
        case .fake:
            break
        }
    }
}
