//
//  DashboardViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 22.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewControllerWithTableView {

    // MARK: - View Model
    var viewModel: DashboardViewModel!

    // MARK: - Variables
    private var feedbackBarButtonItem: UIBarButtonItem?
    private var segmentedControl: UISegmentedControl = UISegmentedControl(items: ["Active", "Archive"])
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        showProgressHUD()
        setup()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for visibleCell in tableView.visibleCells {
            if let cell = visibleCell as? DashboardTableViewCell {
                cell.stopTimer()
            }
        }
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
        bottomViewType = .sort
        sortButton.setTitle(self.viewModel.sortTitle(), for: .normal)
        
        feedbackBarButtonItem = UIBarButtonItem(title: "Feedback", style: .done, target: self, action: #selector(feedbackButtonAction(_:)))
        navigationItem.rightBarButtonItem = feedbackBarButtonItem
        
        segmentedControl.cornerRadius = Constants.SystemSizes.cornerSize
        segmentedControl.tintColor = UIColor.primary
        segmentedControl.selectedSegmentIndex = 0
        let textAttributes = [NSAttributedStringKey.font: UIFont.getFont(.regular, size: 16)]
        segmentedControl.setTitleTextAttributes(textAttributes, for: .normal)
        segmentedControl.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        navigationItem.titleView = segmentedControl
    }
    
    private func setupTableConfiguration() {
        tableView.configure(with: .defaultConfiguration)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibs(for: DashboardViewModel.cellModelsForRegistration)
        
        setupPullToRefresh()
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func updateSortView() {
        sortButton.setTitle(self.viewModel.sortTitle(), for: .normal)
        
        showProgressHUD()
        fetch()
    }
    
    override func fetch() {
        viewModel.refresh { [weak self] (result) in
            self?.hideAll()
            
            switch result {
            case .success:
                self?.reloadData()
            case .failure(let errorType):
                ErrorHandler.handleError(with: errorType, viewController: self)
            }
        }
    }
    
    override func pullToRefresh() {
        super.pullToRefresh()
        
        fetch()
    }
    
    override func sortButtonAction() {
        sortMethod()
    }
    
    // MARK: - Actions
    @IBAction func feedbackButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: String.Alerts.Feedback.alertTitle, preferredStyle: .alert)
        alert.view.tintColor = UIColor.primary
        
        alert.addAction(UIAlertAction(title: String.Alerts.Feedback.websiteButtonText, style: .default, handler: { [weak self] (action) in
            self?.openSafariVC(with: Constants.Urls.feedbackWebAddress)
        }))
        
        alert.addAction(UIAlertAction(title: String.Alerts.Feedback.emailButtonText, style: .default, handler: { [weak self] (action) in
            self?.sendEmailFeedback()
        }))
        
        alert.addAction(UIAlertAction(title: String.Alerts.cancelButtonText, style: .cancel, handler:nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func segmentSelected(sender: UISegmentedControl) {
        viewModel.activePrograms = sender.selectedSegmentIndex == 0
        reloadData()
    }
    
    @objc func sortMethod() {
        let alert = UIAlertController(style: .actionSheet, title: nil, message: nil)
        alert.view.tintColor = UIColor.primary
        
        var selectedIndexRow = viewModel.getSelectedSortingIndex()
        let values = viewModel.sortingValues
        
        let pickerViewValues: [[String]] = [values.map { $0 }]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: selectedIndexRow)
        
        let applyAction = UIAlertAction(title: "Apply", style: .default) { [weak self] (action) in
            guard selectedIndexRow != self?.viewModel.getSelectedSortingIndex() else { return }
            
            self?.viewModel.changeSorting(at: selectedIndexRow)
            self?.updateSortView()
        }
        
        applyAction.isEnabled = false
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { [weak self] vc, picker, index, values in
            
            guard index.row != self?.viewModel.getSelectedSortingIndex() else {
                return applyAction.isEnabled = false
            }
            
            applyAction.isEnabled = true
            selectedIndexRow = index.row
        }
        
        alert.addAction(applyAction)
        
        alert.addAction(title: "Cancel", style: .cancel)
        
        alert.show()
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard viewModel.modelsCount() >= indexPath.row else {
            return
        }
        
        viewModel.showDetail(at: indexPath)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = viewModel.model(at: indexPath) else {
            return UITableViewCell()
        }
        
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        showInfiniteIndicator(value: viewModel.fetchMore(at: indexPath.row))
        
        if let cell = cell as? DashboardTableViewCell {
            cell.startTimer()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? DashboardTableViewCell {
            cell.stopTimer()
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
}

extension DashboardViewController {
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
    
    override func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        viewModel.showProgramList()
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        let text = viewModel.noDataButtonTitle()
        let attributes = [NSAttributedStringKey.foregroundColor : UIColor.Font.white,
                          NSAttributedStringKey.font : UIFont.getFont(.bold, size: 14)]

        return NSAttributedString(string: text, attributes: attributes)
    }
}

extension DashboardViewController: UIViewControllerPreviewingDelegate {
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

extension DashboardViewController: ReloadDataProtocol {
    func didReloadData() {
        reloadData()
    }
}

extension DashboardViewController: ProgramDetailViewControllerProtocol {
    func programDetailDidChangeFavoriteState(with programID: String, value: Bool, request: Bool) {
        showProgressHUD()
        viewModel.changeFavorite(value: value, investmentProgramId: programID, request: request) { [weak self] (result) in
            self?.hideAll()
            
            switch result {
            case .success:
                self?.reloadData()
            default:
                break
            }
        }
    }
}
