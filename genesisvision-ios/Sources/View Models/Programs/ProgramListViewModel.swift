//
//  ProgramListViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 25.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import Foundation

enum ProgramListViewState {
    case programList, programListWithSignIn
}

final class ProgramListViewModel: ListViewModelProtocol {
    var filterModel: FilterModel = FilterModel()
    
    var assetType: AssetType = .program
    
    // MARK: - Variables
    var title: String = "Programs"

    internal var sections: [SectionType] = [.assetList]
    
    var router: ListRouterProtocol!
    var state: ProgramListViewState?
    private weak var reloadDataProtocol: ReloadDataProtocol?
    var canPullToRefresh = true
    var canFetchMoreResults = true
    
    var dataType: DataType = .api

    var skip = 0
    var take = Api.take
    var totalCount = 0

    var showFacets = false

    private var programsList: ProgramsList?
    
    var bottomViewType: BottomViewType {
        if signInButtonEnable {
            return .signInWithFilter
        }
        
        if filterModel.mask == nil, filterModel.levelUpData == nil, filterModel.facetId == nil {
            return .filter
        }
        
        return .none
    }
    
    var viewModels = [CellViewAnyModel]()
    var facetsViewModels: [CellViewAnyModel]?
    
    // MARK: - Init
    init(withRouter router: ListRouterProtocol, reloadDataProtocol: ReloadDataProtocol?, filterModel: FilterModel? = nil, showFacets: Bool = false) {
        self.router = router
        self.reloadDataProtocol = reloadDataProtocol
        self.showFacets = showFacets
        
        if let filterModel = filterModel {
            self.filterModel = filterModel
            if let facetTitle = filterModel.facetTitle {
                self.title = facetTitle + " " + title.lowercased()
            }
        }
        
        state = isLogin() ? .programList : .programListWithSignIn

        NotificationCenter.default.addObserver(self, selector: #selector(programFavoriteStateChangeNotification(notification:)), name: .programFavoriteStateChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .programFavoriteStateChange, object: nil)
    }
    
    // MARK: - Private methods
    private func setupFacets() {
        guard showFacets else { return }
        
        if !sections.contains(.facetList) {
            sections.insert(.facetList, at: 0)
        }
        
        var facets: [Facet] = []
        
        if let programsFacets = PlatformManager.shared.platformInfo?.programsFacets {
            facets.append(contentsOf: programsFacets)
        } else {
            PlatformManager.shared.getPlatformInfo { [weak self] (platformInfo) in
                if let programsFacets = PlatformManager.shared.platformInfo?.programsFacets {
                    facets.append(contentsOf: programsFacets)
                    self?.updateFacets(facets)
                    self?.reloadDataProtocol?.didReloadData()
                }
            }
        }
        
        if isLogin() {
            facets.insert(Facet(id: nil, title: "Favorites", description: nil, logo: nil, url: nil, sortType: nil), at: 0)
        }

        self.updateFacets(facets)
    }
    
    private func updateFacets(_ facets: [Facet]) {
        let facetsViewModel = FacetsViewModel(withRouter: router, facets: facets, assetType: assetType)
        facetsViewModels = [FacetsTableViewCellViewModel(facetsViewModel: facetsViewModel)]
    }
    
    // MARK: - Public methods
    func noDataText() -> String {
        return "There are no programs"
    }
    
    func isLogin() -> Bool {
        return AuthManager.isLogin()
    }
    
    var signInButtonEnable: Bool {
        return state == .programListWithSignIn
    }
    
    func changeFavorite(value: Bool, assetId: String, request: Bool = false, completion: @escaping CompletionBlock) {
        guard request else {
            guard let model = model(at: assetId) as? ProgramTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
            model.program.personalDetails?.isFavorite = value
            completion(.success)
            return
        }
        
        
        ProgramsDataProvider.favorites(isFavorite: !value, assetId: assetId) { [weak self] (result) in
            switch result {
            case .success:
                guard let model = self?.model(at: assetId) as? ProgramTableViewCellViewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
                model.program.personalDetails?.isFavorite = value
                completion(.success)
            case .failure(let errorType):
                print(errorType)
                completion(result)
            }
        }
    }
    
    func updateViewModels(_ programsList: ProgramsList?) {
        guard let programsList = programsList else { return }
        
        self.programsList = programsList
        
        var viewModels = [ProgramTableViewCellViewModel]()
        
        let totalCount = programsList.total ?? 0
        
        programsList.programs?.forEach({ (program) in
            guard let programListRouter = self.router as? ListRouter else { return }
            
            let programTableViewCellViewModel = ProgramTableViewCellViewModel(program: program, delegate: programListRouter.currentController as? ProgramListViewController)
            viewModels.append(programTableViewCellViewModel)
        })

        self.updateFetchedData(totalCount: totalCount, viewModels)
    }
    
    // MARK: - Private methods
    @objc private func programFavoriteStateChangeNotification(notification: Notification) {
        if let isFavorite = notification.userInfo?["isFavorite"] as? Bool, let assetId = notification.userInfo?["programId"] as? String {
            changeFavorite(value: isFavorite, assetId: assetId) { [weak self] (result) in
                self?.reloadDataProtocol?.didReloadData()
            }
        }
    }
}

// MARK: - Fetch
extension ProgramListViewModel {
    // MARK: - Public methods
    func fetchMore(at row: Int) -> Bool {
        if modelsCount() - Api.fetchThreshold == row && canFetchMoreResults && modelsCount() >= take {
            fetchMore()
        }
        
        return skip < totalCount
    }
    
    func fetchMore() {
        guard skip < totalCount else { return }

        canFetchMoreResults = false
        fetch({ [weak self] (totalCount, viewModels) in
            var allViewModels = self?.viewModels ?? [ProgramTableViewCellViewModel]()

            viewModels.forEach({ (viewModel) in
                allViewModels.append(viewModel)
            })

            self?.updateFetchedData(totalCount: totalCount, allViewModels as! [ProgramTableViewCellViewModel])
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
        if let mask = filterModel.mask, mask.isEmpty {
            updateFetchedData(totalCount: 0, [])
            return
        }
        
        skip = 0
        setupFacets()
        
        fetch({ [weak self] (totalCount, viewModels) in
            self?.updateFetchedData(totalCount: totalCount, viewModels)
            }, completionError: completion)
    }
    
    private func updateFetchedData(totalCount: Int, _ viewModels: [ProgramTableViewCellViewModel]) {
        self.viewModels = viewModels
        self.totalCount = totalCount
        self.skip += self.take
        self.canFetchMoreResults = true
        self.reloadDataProtocol?.didReloadData()
    }

    // MARK: - Private methods
    private func fetch(_ completionSuccess: @escaping (_ totalCount: Int, _ viewModels: [ProgramTableViewCellViewModel]) -> Void, completionError: @escaping CompletionBlock) {
        ProgramsDataProvider.get(filterModel, skip: skip, take: take, completion: { [weak self] (programsList) in
            guard let programsList = programsList else { return completionError(.failure(errorType: .apiError(message: nil))) }
            
            self?.programsList = programsList
            
            var viewModels = [ProgramTableViewCellViewModel]()
            
            let totalCount = programsList.total ?? 0
            
            programsList.programs?.forEach({ (program) in
                guard let programListRouter = self?.router as? ListRouter else { return completionError(.failure(errorType: .apiError(message: nil))) }
                
                let programTableViewCellViewModel = ProgramTableViewCellViewModel(program: program, delegate: programListRouter.currentController as? ProgramListViewController)
                viewModels.append(programTableViewCellViewModel)
            })
            
            completionSuccess(totalCount, viewModels)
            completionError(.success)
        }, errorCompletion: completionError)
    }
}
