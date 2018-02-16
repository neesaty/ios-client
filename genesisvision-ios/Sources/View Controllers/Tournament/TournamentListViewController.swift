//
//  TournamentListViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 11.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class TournamentListViewController: BaseViewControllerWithTableView {
    
    // MARK: - Variables
    private var canFetchMoreResults = true
    private var refreshControl: UIRefreshControl!
    
    // MARK: - View Model
    var viewModel: TournamentListViewModel! {
        didSet {
            pullToRefresh()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
            searchBar.showsCancelButton = false
            searchBar.isTranslucent = true
            searchBar.backgroundColor = UIColor.Background.main
            searchBar.barTintColor = UIColor.primary
            searchBar.tintColor = UIColor.primary
            searchBar.placeholder = "Search"
        }
    }
    
    @IBOutlet override var tableView: UITableView! {
        didSet {
            setupTableConfiguration()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private methods
    private func setupTableConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.registerNibs(for: TournamentListViewModel.cellModelsForRegistration)
        tableView.registerHeaderNib(for: TournamentListViewModel.viewModelsForRegistration)
        
        setupPullToRefresh()
    }
    
    private func setupPullToRefresh() {
        let tintColor = UIColor.primary
        let attributes = [NSAttributedStringKey.foregroundColor : tintColor]
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Loading...", attributes: attributes)
        refreshControl.tintColor = tintColor
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    private func setup() {
        registerForPreviewing()
        
        title = viewModel.title
        showProgressHUD()
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    private func updateData() {
        showProgressHUD()
        pullToRefresh()
    }
    
    private func fetchMore() {
        self.canFetchMoreResults = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.viewModel.fetchMore { [weak self] (result) in
            self?.canFetchMoreResults = true
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success:
                self?.tableView.reloadData()
            case .failure:
                break
            }
        }
    }
    
    @objc private func pullToRefresh() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        viewModel.refresh { [weak self] (result) in
            self?.hideHUD()
            switch result {
            case .success:
                self?.refreshControl?.endRefreshing()
                self?.searchBar.updateConstraints()
                self?.tableView.reloadData()
            case .failure(let reason):
                print("Error with reason: ")
                print(reason ?? "")
            }
        }
    }
}

extension TournamentListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard viewModel.modelsCount() >= indexPath.row else {
            return
        }
        
        guard let participantViewModel = viewModel.model(for: indexPath.row)?.participantViewModel else { return }
        
        viewModel.showDetail(with: participantViewModel)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel.model(for: indexPath.row) else {
            return UITableViewCell()
        }
        
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (viewModel.modelsCount() - indexPath.row) == Constants.Api.fetchThreshold && canFetchMoreResults {
            fetchMore()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.headerHeight(for: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = viewModel.headerTitle(for: section) else {
            return nil
        }
        
        let header = tableView.dequeueReusableHeaderFooterView() as DefaultTableHeaderView
        header.headerLabel.font = UIFont.systemFont(ofSize: 15.0)
        header.headerLabel.text = title
        header.headerLabel.textColor = UIColor.Font.medium
        return header
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
}


extension TournamentListViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing,
                           viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let cellPosition = self.tableView.convert(location, from: self.view)
        
        guard let indexPath = tableView.indexPathForRow(at: cellPosition) else { return nil }
        
        guard let vc = viewModel.getDetailViewController(with: indexPath.row) else { return nil }
        
        vc.preferredContentSize = CGSize(width: 0.0, height: 500)
        
        return vc
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        push(viewController: viewControllerToCommit)
    }
}

extension TournamentListViewController: DZNEmptyDataSetDelegate {
    override func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = viewModel.noDataText()
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.Font.dark,
                          NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25, weight: .bold)]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    override func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.noDataPlaceholder
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        updateData()
    }
}

extension TournamentListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty && searchText != viewModel.searchText || searchText.isEmpty && !viewModel.searchText.isEmpty else {
            return
        }
        
        viewModel.searchText = searchText
        
        updateData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideKeyboard()
        
        searchBar.text = ""
        
        guard let searchText = searchBar.text, !viewModel.searchText.isEmpty else {
            return
        }
    
        viewModel.searchText = searchText
        
        updateData()
    }
}

