//
//  ManagerProgramListViewController.swift
//  genesisvision-ios
//
//  Created by George on 18/10/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class ManagerProgramListViewController: BaseViewControllerWithTableView {
    
    // MARK: - View Model
    var viewModel: ManagerProgramListViewModel!
    
    // MARK: - Views
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetch()
    }
    
    // MARK: - Private methods
    private func setup() {
        setupTableConfiguration()
        registerForPreviewing()
        
        setupUI()
    }
    
    private func setupUI() {
        bottomViewType = viewModel.bottomViewType
        
        sortButton.setTitle(self.viewModel?.sortingDelegateManager.sortTitle(), for: .normal)
        
        tableView.isScrollEnabled = false
    }
    
    private func setupTableConfiguration() {
        tableView.configure(with: .defaultConfiguration)
        tableView.contentInset.bottom = -44.0
        
        tableView.bounces = true
        tableView.delegate = self.viewModel?.programListDelegateManager
        tableView.dataSource = self.viewModel?.programListDelegateManager
        tableView.registerNibs(for: viewModel.cellModelsForRegistration)
        
        setupPullToRefresh(scrollView: tableView)
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData()
        }
    }
    
    private func sortMethod() {
        bottomSheetController = BottomSheetController()
        bottomSheetController.addNavigationBar("Sort by", buttonTitle: "High to Low", buttonSelectedTitle: "Low to High", normalImage: #imageLiteral(resourceName: "img_profit_filter_icon"), selectedImage: #imageLiteral(resourceName: "img_profit_filter_desc_icon"), buttonAction: #selector(highToLowButtonAction), buttonTarget: self, buttonSelected: viewModel.highToLowValue)
        
        bottomSheetController.addTableView { [weak self] tableView in
            tableView.delegate = self?.viewModel.sortingDelegateManager
            tableView.dataSource = self?.viewModel.sortingDelegateManager
            tableView.separatorStyle = .none
        }
        
        viewModel.sortingDelegateManager.tableViewProtocol = self
        bottomSheetController.present()
    }
    
    override func fetch() {
        viewModel.refresh { [weak self] (result) in
            self?.hideAll()
            
            switch result {
            case .success:
                break
            case .failure(let errorType):
                ErrorHandler.handleError(with: errorType, viewController: self)
            }
        }
    }
    
    override func pullToRefresh() {
        super.pullToRefresh()
        
        fetch()
    }
    
    func showFilterVC() {
//        router.show(routeType: .showFilterVC(programListViewModel: self as! ProgramListViewModel))
    }
    
    // MARK: - Actions
    @objc func highToLowButtonAction() {
        viewModel.highToLowValue = !viewModel.highToLowValue
        bottomSheetController.dismiss()
    }
}

extension ManagerProgramListViewController {
    override func sortButtonAction() {
        sortMethod()
    }
    
    override func filterButtonAction() {
//        if let viewModel = viewModel {
//            viewModel.showFilterVC()
//        }
    }
}

// MARK: - UIViewControllerPreviewingDelegate
extension ManagerProgramListViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let cellPosition = tableView.convert(location, from: view)
        
        guard let indexPath = tableView.indexPathForRow(at: cellPosition),
            let vc = viewModel.getDetailsViewController(with: indexPath),
            let cell = tableView.cellForRow(at: indexPath)
            else { return nil }
        
        vc.preferredContentSize = CGSize(width: 0.0, height: 500)
        previewingContext.sourceRect = view.convert(cell.frame, from: tableView)
        
        return vc
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        push(viewController: viewControllerToCommit)
    }
}

// MARK: - ReloadDataProtocol
extension ManagerProgramListViewController: ReloadDataProtocol {
    func didReloadData() {
        reloadData()
    }
}

extension ManagerProgramListViewController {
    override func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = viewModel.noDataText()
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.Font.dark,
                          NSAttributedStringKey.font : UIFont.getFont(.bold, size: 25)]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    override func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        if let imageName = viewModel.noDataImageName() {
            return UIImage(named: imageName)
        }
        
        return UIImage.noDataPlaceholder
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        let text = viewModel.noDataButtonTitle()
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.Font.white,
                          NSAttributedStringKey.font : UIFont.getFont(.bold, size: 14)]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}

extension ManagerProgramListViewController: SortingDelegate {
    func didSelectSorting() {
        bottomSheetController.dismiss()
        fetch()
    }
}

// MARK: - ProgramProtocol
extension ManagerProgramListViewController: ProgramProtocol {
    func programDetailDidChangeFavoriteState(with programID: String, value: Bool, request: Bool) {
        showProgressHUD()
        viewModel.changeFavorite(value: value, programId: programID, request: request) { [weak self] (result) in
            self?.hideAll()
        }
    }
}