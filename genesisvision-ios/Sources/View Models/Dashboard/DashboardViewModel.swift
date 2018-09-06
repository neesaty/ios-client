//
//  DashboardViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 26.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UITableViewHeaderFooterView

final class DashboardViewModel {
    
    enum SectionType {
        case chart
        case portfolioEvents
        case programList
    }
    
    // MARK: - Variables
    var activePrograms = true
    
    var title = "Dashboard"
    
    var sortingDelegateManager = SortingDelegateManager()
    var currencyDelegateManager = CurrencyDelegateManager()
    var dateRangeDelegateManager = DateRangeDelegateManager()
    
    var highToLowValue: Bool = false
    
    private var sections: [SectionType] = [.chart, .portfolioEvents, .programList]
    
    private var router: DashboardRouter!
    private var dashboard: InvestorDashboard?
    private weak var reloadDataProtocol: ReloadDataProtocol?
    
    var dateRangeType: DateRangeType = .day {
        didSet {
            switch dateRangeType {
            case .custom:
                dateRangeTo.setTime(hour: 0, min: 0, sec: 0)
                dateRangeFrom.setTime(hour: 23, min: 59, sec: 59)
            default:
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: dateRangeTo)
                let min = calendar.component(.minute, from: dateRangeTo)
                let sec = calendar.component(.second, from: dateRangeTo)
                dateRangeFrom.setTime(hour: hour, min: min, sec: sec)
            }
        }
    }
    var dateRangeFrom: Date = Date().previousDate()
    var dateRangeTo: Date = Date()
    
    var canFetchMoreResults = true
    var programsCount: String = ""
    var skip = 0
    var take = Constants.Api.take
    var totalCount = 0 {
        didSet {
            programsCount = "\(totalCount) programs"
        }
    }
    
    var bottomViewType: BottomViewType {
        return .sort
    }
    
    var investMaxAmountFrom: Double?
    var investMaxAmountTo: Double?
    var searchText = ""
    var viewModels = [DashboardTableViewCellViewModel]() {
        didSet {
            self.activeViewModels = viewModels.filter { $0.investmentProgram.isArchived != true }
            self.archiveViewModels = viewModels.filter { $0.investmentProgram.isArchived == true }
        }
    }
    var activeViewModels = [DashboardTableViewCellViewModel]()
    var archiveViewModels = [DashboardTableViewCellViewModel]()
    
    // MARK: - Init
    init(withRouter router: DashboardRouter) {
        self.router = router
        self.reloadDataProtocol = router.topViewController() as? ReloadDataProtocol
        
        NotificationCenter.default.addObserver(self, selector: #selector(enableTwoFactorNotification(notification:)), name: .twoFactorEnable, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(programFavoriteStateChangeNotification(notification:)), name: .programFavoriteStateChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .twoFactorEnable, object: nil)
        NotificationCenter.default.removeObserver(self, name: .programFavoriteStateChange, object: nil)
    }
    
    // MARK: - Public methods
    func changeFavorite(value: Bool, investmentProgramId: String, request: Bool = false, completion: @escaping CompletionBlock) {
        guard request else {
            guard let model = model(at: investmentProgramId) as? DashboardTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
            model.investmentProgram.isFavorite = value
            completion(.success)
            return
        }
        
        ProgramDataProvider.programFavorites(isFavorite: !value, investmentProgramId: investmentProgramId) { [weak self] (result) in
            switch result {
            case .success:
                guard let model = self?.model(at: investmentProgramId) as? DashboardTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
                model.investmentProgram.isFavorite = value
                completion(.success)
            case .failure(let errorType):
                print(errorType)
                completion(result)
            }
        }
    }
    
    // MARK: - Private methods
    @objc private func enableTwoFactorNotification(notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: .twoFactorEnable, object: nil)
        
        router.showTwoFactorEnable()
    }
    
    @objc private func programFavoriteStateChangeNotification(notification: Notification) {
        if let isFavorite = notification.userInfo?["isFavorite"] as? Bool, let investmentProgramId = notification.userInfo?["investmentProgramId"] as? String {
            changeFavorite(value: isFavorite, investmentProgramId: investmentProgramId) { [weak self] (result) in
                self?.reloadDataProtocol?.didReloadData()
            }
        }
    }
}

// MARK: - TableView
extension DashboardViewModel {
    // MARK: - Public methods
    /// Return view models for registration cell Nib files
    var cellModelsForRegistration: [CellViewAnyModel.Type] {
        return [InvestorDashboardPortfolioTableViewCellViewModel.self,
                InvestorDashboardPortfolioEventsTableViewCellViewModel.self,
                DashboardHeaderTableViewCellViewModel.self,
                DashboardTableViewCellViewModel.self]
    }
    
    /// Return view models for registration header/footer Nib files
    var viewModelsForRegistration: [UITableViewHeaderFooterView.Type] {
        return [SegmentedHeaderFooterView.self]
    }
    
    func modelsCount() -> Int {
        return activePrograms ? activeViewModels.count : archiveViewModels.count
    }
    
    func numberOfSections() -> Int {
        return modelsCount() > 0 ? sections.count : 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch sections[section] {
        case .chart:
            return 1
        case .portfolioEvents:
            return 1
        case .programList:
            return modelsCount()
        }
    }
    
    func headerTitle(for section: Int) -> String? {
        return nil
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case .chart:
            return 350.0
        case .portfolioEvents:
            return 160.0
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func headerHeight(for section: Int) -> CGFloat {
        switch sections[section] {
        case .programList:
            return 44.0
        default:
            return 0.0
        }
    }
    
    func headerSegments(for section: Int) -> [String] {
        switch sections[section] {
        case .programList:
            return ["Programs", "Funds"]
        default:
            return []
        }
    }
}

// MARK: - Navigation
extension DashboardViewModel {
    func logoImageName() -> String? {
        let imageName = "img_dashboard_logo"
        return imageName
    }
    
    func noDataText() -> String {
        return "you don’t have \nany programs yet.."
    }
    
    func noDataImageName() -> String? {
        return logoImageName()
    }
    
    func noDataButtonTitle() -> String {
        let text = "Browse programs"
        return text.uppercased()
    }
    
    func showDetail(at indexPath: IndexPath) {
        guard let model: DashboardTableViewCellViewModel = model(at: indexPath) as? DashboardTableViewCellViewModel else { return }
        
        let investmentProgram = model.investmentProgram
        guard let investmentProgramId = investmentProgram.id else { return }
        
        router.show(routeType: .showProgramDetails(investmentProgramId: investmentProgramId.uuidString))
    }
    
    func showProgramList() {
        router.show(routeType: .programList)
    }
}

// MARK: - Fetch
extension DashboardViewModel {
    // MARK: - Public methods
    func fetch(completion: @escaping CompletionBlock) {
        fetch({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    func fetchMore(at row: Int) -> Bool {
        if modelsCount() - Constants.Api.fetchThreshold == row && canFetchMoreResults {
            fetchMore()
        }
        
        return skip < totalCount
    }
    
    func fetchMore() {
        guard skip < totalCount else { return }
        
        canFetchMoreResults = false
        fetch({ [weak self] (totalCount, viewModels) in
            var allViewModels = self?.viewModels ?? [DashboardTableViewCellViewModel]()
            
            viewModels.forEach({ (viewModel) in
                allViewModels.append(viewModel)
            })
            
            self?.updateFetchedData(totalCount: totalCount, allViewModels)
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
        skip = 0
        
        fetch({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    /// Get TableViewCellViewModel for IndexPath
    func model(at indexPath: IndexPath) -> CellViewAnyModel? {
        guard dashboard != nil else {
            return nil
        }
        
        let type = sections[indexPath.section]
        switch type {
        case .chart :
            return InvestorDashboardPortfolioTableViewCellViewModel()
        case .portfolioEvents:
            return InvestorDashboardPortfolioEventsTableViewCellViewModel()
        case .programList:
            return activePrograms ? activeViewModels[indexPath.row] : archiveViewModels[indexPath.row]
        }
    }
    
    func model(at investmentProgramId: String) -> CellViewAnyModel? {
        if activePrograms {
            if let i = activeViewModels.index(where: { $0.investmentProgram.id?.uuidString == investmentProgramId }) {
                return activeViewModels[i]
            }
        } else {
            if let i = archiveViewModels.index(where: { $0.investmentProgram.id?.uuidString == investmentProgramId }) {
                return archiveViewModels[i]
            }
        }
        
        return nil
    }
    
    func getDetailsViewController(with indexPath: IndexPath) -> ProgramDetailsTabmanViewController? {
        guard let model = model(at: indexPath) as? DashboardTableViewCellViewModel else {
            return nil
        }
        
        let investmentProgram = model.investmentProgram
        guard let investmentProgramId = investmentProgram.id else { return nil}
        
        return router.getDetailsViewController(with: investmentProgramId.uuidString)
    }
    
    func highToLowButtonAction() {
        
    }
    
    // MARK: - Private methods
    private func updateFetchedData(totalCount: Int, _ viewModels: [DashboardTableViewCellViewModel]) {
        self.viewModels = viewModels
        self.totalCount = totalCount
        self.skip += self.take
        self.canFetchMoreResults = true
        self.reloadDataProtocol?.didReloadData()
    }
    
    private func fetch(_ completionSuccess: @escaping (_ totalCount: Int, _ viewModels: [DashboardTableViewCellViewModel]) -> Void, completionError: @escaping CompletionBlock) {
        
        DashboardDataProvider.getProgram(with: sortingDelegateManager.sorting, completion: { [weak self] (dashboard) in
            guard let dashboard = dashboard else { return completionError(.failure(errorType: .apiError(message: nil))) }
            
            self?.dashboard = dashboard
            
            var dashboardProgramViewModels = [DashboardTableViewCellViewModel]()
            
            let totalCount = dashboard.investmentPrograms?.count ?? 0
            
            dashboard.investmentPrograms?.forEach({ (dashboardProgram) in
                let dashboardTableViewCellModel = DashboardTableViewCellViewModel(investmentProgram: dashboardProgram, reloadDataProtocol: self, delegate: self?.router.dashboardViewController)
                dashboardProgramViewModels.append(dashboardTableViewCellModel)
            })
            
            completionSuccess(totalCount, dashboardProgramViewModels)
            completionError(.success)
        }, errorCompletion: completionError)
    }
}

extension DashboardViewModel: ReloadDataProtocol {
    func didReloadData() {
        refresh { (result) in }
    }
}

protocol TableViewProtocol: class {
    func didSelectRow(at indexPath: IndexPath)
}

final class SortingDelegateManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableViewProtocol: TableViewProtocol?
    
    // MARK: - Variables
    var highToLowValue: Bool = true
    
    var sorting: InvestorAPI.Sorting_apiInvestorDashboardGet = Constants.Sorting.dashboardDefault
    
    var sortingDescKeys: [InvestorAPI.Sorting_apiInvestorDashboardGet] = [.byProfitDesc,
                                                                      .byLevelDesc,
                                                                      .byBalanceDesc,
                                                                      .byOrdersDesc,
                                                                      .byEndOfPeriodDesc,
                                                                      .byTitleDesc]
    
    var sortingAscKeys: [InvestorAPI.Sorting_apiInvestorDashboardGet] = [.byProfitAsc,
                                                                      .byLevelAsc,
                                                                      .byBalanceAsc,
                                                                      .byOrdersAsc,
                                                                      .byEndOfPeriodAsc,
                                                                      .byTitleAsc]
    
    var sortingValues: [String] = ["profit",
                                   "level",
                                   "balance",
                                   "orders",
                                   "end of period",
                                   "title"]
    
    struct SortingList {
        var sortingValue: String
        var sortingKey: InvestorAPI.Sorting_apiInvestorDashboardGet
    }
    
    var sortingDescList: [SortingList] {
        return sortingValues.enumerated().map { (index, element) in
            return SortingList(sortingValue: element, sortingKey: sortingDescKeys[index])
        }
    }
    
    var sortingAscList: [SortingList] {
        return sortingValues.enumerated().map { (index, element) in
            return SortingList(sortingValue: element, sortingKey: sortingAscKeys[index])
        }
    }
    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    // MARK: - Private methods
    func getSortingValue(sortingKey: InvestorAPI.Sorting_apiInvestorDashboardGet) -> String {
        guard let index = sortingDescKeys.index(of: sortingKey) else { return "" }
        return sortingValues[index]
    }
    
    func changeSorting(at index: Int) {
        sorting = highToLowValue ? sortingDescKeys[index] : sortingAscKeys[index]
    }
    
    func getSelectedSortingIndex() -> Int {
        return sortingDescKeys.index(of: sorting) ?? 0
    }
    
    func sortTitle() -> String? {
        return "Sort by " + getSortingValue(sortingKey: sorting)
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        changeSorting(at: indexPath.row)
        
        tableViewProtocol?.didSelectRow(at: indexPath)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortingValues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sortingValues[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.168627451, blue: 0.2, alpha: 1)
        
        cell.textLabel?.textColor = indexPath.row == getSelectedSortingIndex() ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) :  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.7)
        cell.accessoryType = indexPath.row == getSelectedSortingIndex() ? .checkmark : .none
        
        return cell
    }
}

final class CurrencyDelegateManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "wrre"
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.168627451, blue: 0.2, alpha: 1)
        cell.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
}

final class DateRangeDelegateManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "wrre"
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.168627451, blue: 0.2, alpha: 1)
        cell.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
}
