//
//  ProgramViewController.swift
//  genesisvision-ios
//
//  Created by George on 07/05/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit
import Tabman

class ProgramViewController: BaseTabmanViewController<ProgramViewModel> {
    // MARK: - View Model
    weak var programInfoViewControllerProtocol: FavoriteStateChangeProtocol?

    private var favoriteBarButtonItem: UIBarButtonItem!
    private var notificationsBarButtonItem: UIBarButtonItem!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProgressHUD()
        setup()
        viewModel.fetch { [weak self] (result) in
            self?.hideHUD()
            self?.reloadData()
            self?.title = self?.viewModel.title
        }
    }
    
    // MARK: - Private methods
    private func setup() {
        navigationItem.title = viewModel.title
        
        dataSource = viewModel.dataSource
        
        setupUI()
    }
    
    private func setupUI() {
        guard AuthManager.isLogin() else { return }
        
        if let isFavorite = self.viewModel?.isFavorite {
            favoriteBarButtonItem = UIBarButtonItem(image: isFavorite ? #imageLiteral(resourceName: "img_favorite_icon_selected") : #imageLiteral(resourceName: "img_favorite_icon"), style: .done, target: self, action: #selector(favoriteButtonAction))
        }
        
        notificationsBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "img_notifications_icon"), style: .done, target: self, action: #selector(notificationsButtonAction))
        
        navigationItem.rightBarButtonItems = [favoriteBarButtonItem, notificationsBarButtonItem]
    }
    
    @objc func notificationsButtonAction() {
        viewModel.showNotificationSettings()
    }
    
    // MARK: - IBActions
    @objc func favoriteButtonAction() {
        guard let isFavorite = self.viewModel?.isFavorite else { return }
        self.favoriteBarButtonItem.image = !isFavorite ? #imageLiteral(resourceName: "img_favorite_icon_selected") : #imageLiteral(resourceName: "img_favorite_icon")
        
        showProgressHUD()
        self.viewModel?.changeFavorite(value: isFavorite, request: true) { [weak self] (result) in
            self?.hideHUD()
            
            switch result {
            case .success:
                break
            case .failure(let errorType):
                self?.favoriteBarButtonItem.image = isFavorite ? #imageLiteral(resourceName: "img_favorite_icon_selected") : #imageLiteral(resourceName: "img_favorite_icon")
                ErrorHandler.handleError(with: errorType, viewController: self, hud: true)
            }
        }
    }
}

extension ProgramViewController: ReloadDataProtocol {
    func didReloadData() {
        
    }
}
extension ProgramViewController: FavoriteStateUpdatedProtocol {
    func didFavoriteStateUpdated() {
        DispatchQueue.main.async {
            guard AuthManager.isLogin() else { return }
            guard let isFavorite = self.viewModel?.isFavorite else { return }
            
            guard self.favoriteBarButtonItem != nil else {
                self.favoriteBarButtonItem = UIBarButtonItem(image: isFavorite ? #imageLiteral(resourceName: "img_favorite_icon_selected") : #imageLiteral(resourceName: "img_favorite_icon"), style: .done, target: self, action: #selector(self.favoriteButtonAction))
                self.navigationItem.rightBarButtonItems = [self.favoriteBarButtonItem]
                return
            }
            
            self.favoriteBarButtonItem.image = isFavorite ? #imageLiteral(resourceName: "img_favorite_icon_selected") : #imageLiteral(resourceName: "img_favorite_icon")
        }
    }
}

final class ProgramViewModel: TabmanViewModel {
    enum TabType: String {
        case info = "Info"
        case profit = "Profit"
        case balance = "Balance"
        case trades = "Trades"
        case openPosition = "Open position"
        case periodHistory = "Period history"
        case events = "My history"
    }
    var tabTypes: [TabType] = []
    var controllers = [TabType : UIViewController]()
    
    // MARK: - Variables
    var assetId: String?
    var assetType: AssetType = .program
    
    public private(set) var tradingAccounts: ItemsViewModelTradingAccountDetails?
    public private(set) var signalSubscription: SignalSubscription?
    
    var programDetailsFull: ProgramFollowDetailsFull? {
        didSet {
            if programDetailsFull?.programDetails != nil {
                title = programDetailsFull?.publicInfo?.title ?? ""
                tabTypes = [.info, .profit, .balance, .trades, .openPosition, .periodHistory, .events]
            } else if programDetailsFull?.followDetails != nil {
                title = programDetailsFull?.publicInfo?.title ?? ""
                tabTypes = [.info, .profit, .balance, .trades, .openPosition, .events]
            }
            self.tabTypes.forEach({ controllers[$0] = getViewController($0) })
        }
    }
    
    var isFavorite: Bool {
        return programDetailsFull?.programDetails?.personalDetails?.isFavorite ?? false
    }
    weak var favoriteStateUpdatedProtocol: FavoriteStateUpdatedProtocol?
    
    weak var reloadDataProtocol: ReloadDataProtocol?
    
    // MARK: - Init
    init(withRouter router: Router, assetId: String? = nil) {
        super.init(withRouter: router, viewControllersCount: 1, defaultPage: 0)
        self.assetId = assetId
        self.title = ""
        
        font = UIFont.getFont(.semibold, size: 16)
        
        NotificationCenter.default.addObserver(self, selector: #selector(programFavoriteStateChangeNotification(notification:)), name: .programFavoriteStateChange, object: nil)
        
        self.dataSource = PageboyDataSource(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .programFavoriteStateChange, object: nil)
    }
    
    func getViewController(_ type: TabType) -> UIViewController? {
        if let saved = controllers[type] { return saved }
        let currency = getPlatformCurrencyType()
        
        guard let router = router as? ProgramRouter, let assetId = self.assetId else { return nil }
        
        switch type {
        case .info:
            return router.getInfo(with: assetId)
        case .balance:
            let viewModel = ProgramBalanceViewModel(withRouter: router, assetId: assetId, reloadDataProtocol: router.programViewController)
            
            return router.getBalanceViewController(with: viewModel)
        case .profit:
            guard let currency = programDetailsFull?.tradingAccountInfo?.currency?.rawValue, let currencyType = CurrencyType(rawValue: currency) else { return nil }
            let viewModel = ProgramProfitViewModel(withRouter: router, assetId: assetId, reloadDataProtocol: router.programViewController, currency: currencyType)
            
            return router.getProfitViewController(with: viewModel)
        case .periodHistory:
            return router.getPeriodHistory(with: assetId, currency: currency)
        case .trades:
            return router.getTrades(with: assetId, currencyType: currency)
        case .openPosition:
            return router.getTradesOpen(with: assetId, currencyType: currency)
        case .events:
            return router.getEvents(with: assetId)
        }
    }
}
extension ProgramViewModel: TabmanDataSourceProtocol {
    func getCount() -> Int {
        return tabTypes.count
    }
    
    func getItem(_ index: Int) -> TMBarItem? {
        let type = tabTypes[index]
    
        return TMBarItem(title: type.rawValue)
    }
    
    func getViewController(_ index: Int) -> UIViewController? {
        return getViewController(tabTypes[index])
    }
}
// MARK: - Actions
extension ProgramViewModel {
    // MARK: - Public methods
    func showNotificationSettings() {
        //FIXME: program or follow
        router.showAssetNotificationsSettings(assetId, title: programDetailsFull?.publicInfo?.title ?? "Program Settings", type: .program)
    }
    
    func showAboutLevels() {
        guard let rawValue = programDetailsFull?.tradingAccountInfo?.currency?.rawValue, let currency = CurrencyType(rawValue: rawValue) else { return }
        
        router.showAboutLevels(currency)
    }
    
    func fetch(_ completion: @escaping CompletionBlock) {
        guard let assetId = self.assetId else { return }
        
        switch assetType {
        case .program:
            ProgramsDataProvider.get(assetId, completion: { [weak self] (viewModel) in
                guard let viewModel = viewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
                
                self?.programDetailsFull = viewModel
                completion(.success)
            }, errorCompletion: completion)
        case .follow:
            FollowsDataProvider.get(assetId, completion: { [weak self] (viewModel) in
                guard let viewModel = viewModel else { return completion(.failure(errorType: .apiError(message: nil))) }
                
                self?.programDetailsFull = viewModel
                completion(.success)
            }, errorCompletion: completion)
        default:
            break
        }
        
    }
    
    func changeFavorite(value: Bool? = nil, request: Bool = false, completion: @escaping CompletionBlock) {
        guard request else {
            programDetailsFull?.programDetails?.personalDetails?.isFavorite = value
            return completion(.success)
        }
        
        guard
            let personalProgramDetails = programDetailsFull?.programDetails?.personalDetails,
            let isFavorite = personalProgramDetails.isFavorite,
            let assetId = assetId
            else { return completion(.failure(errorType: .apiError(message: nil))) }
        
        ProgramsDataProvider.favorites(isFavorite: isFavorite, assetId: assetId) { [weak self] (result) in
            switch result {
            case .success:
                self?.programDetailsFull?.programDetails?.personalDetails?.isFavorite = !isFavorite
            case .failure(let errorType):
                print(errorType)
                self?.programDetailsFull?.programDetails?.personalDetails?.isFavorite = isFavorite
            }
            
            completion(result)
        }
    }
    
    // MARK: - Private methods
    @objc private func programFavoriteStateChangeNotification(notification: Notification) {
        if let isFavorite = notification.userInfo?["isFavorite"] as? Bool, let assetId = notification.userInfo?["programId"] as? String, assetId == self.assetId {
            changeFavorite(value: isFavorite) { [weak self] (result) in
                self?.reloadDataProtocol?.didReloadData()
            }
        }
    }
}
