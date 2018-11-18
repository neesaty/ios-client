//
//  DashboardRouter.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 26.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UINavigationController

enum DashboardRouteType {
    case showProgramDetails(programId: String), showFundDetails(fundId: String), assetList, notificationList, allEvents, requests(programRequests: ProgramRequests?), showFilterVC(listViewModel: ListViewModelProtocol, filterModel: FilterModel, filterType: FilterType, sortingType: SortingType)
}

class DashboardRouter: Router, ListRouterProtocol {
    
    var dashboardViewController: DashboardViewController!
    
    var chartsViewController: ChartsViewController?
    var eventsViewController: EventsViewController?
    var dashboardAssetsViewController: AssetsViewController?
    
    var programListViewController: DashboardProgramListViewController?
    var fundListViewController: DashboardFundListViewController?
    
    // MARK: - Lifecycle
    init(parentRouter: Router?, navigationController: UINavigationController?, dashboardViewController: DashboardViewController) {
        super.init(parentRouter: parentRouter, navigationController: navigationController)
        
        self.dashboardViewController = dashboardViewController
    }

    // MARK: - Public methods
    func show(routeType: DashboardRouteType) {
        switch routeType {
        case .showProgramDetails(let programId):
            showProgramDetails(with: programId)
        case .showFundDetails(let fundId):
            showFundDetails(with: fundId)
        case .assetList:
            showAssetList()
        case .notificationList:
            showNotificationList()
        case .allEvents:
            showEvents()
        case .requests(let programRequests):
            showRequests(programRequests)
        case .showFilterVC(let listViewModel, let filterModel, let filterType, let sortingType):
            showFilterVC(with: listViewModel, filterModel: filterModel, filterType: filterType, sortingType: sortingType)
        }
    }
    
    // MARK: - Private methods
    private func showAssetList() {
        changeTab(withParentRouter: self, to: .assetList)
    }
    
    private func showRequests(_ programRequests: ProgramRequests?) {
        dashboardViewController.showRequests(programRequests)
    }
}
