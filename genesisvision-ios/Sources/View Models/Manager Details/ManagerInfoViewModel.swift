//
//  ManagerInfoViewModel.swift
//  genesisvision-ios
//
//  Created by George on 18/10/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UITableViewHeaderFooterView

final class ManagerInfoViewModel: ViewModelWithListProtocol {
    enum SectionType {
        case details
    }
    enum RowType {
        case header
        case info
        case about
    }
    
    // MARK: - Variables
    var title: String = "Info"
    
    var canPullToRefresh: Bool = true
    
    lazy var dataSource: TableViewDataSource = TableViewDataSource(self)
    
    private var router: Router
    
    var managerId: String!
    
    public private(set) var publicProfile: PublicProfile?

    private var sections: [SectionType] = [.details]
    private var rows: [RowType] = [.header, .info, .about]
    
    
    var viewModels: [CellViewAnyModel] = []
    
    /// Return view models for registration cell Nib files
    var cellModelsForRegistration: [CellViewAnyModel.Type] {
        return [DefaultTableViewCellViewModel.self, ManagerTableViewCellViewModel.self]
    }
    weak var delegate: BaseTableViewProtocol?
    // MARK: - Init
    init(withRouter router: Router,
         managerId: String? = nil,
         delegate: BaseTableViewProtocol? = nil) {
        self.router = router
        
        if let managerId = managerId {
            self.managerId = managerId
        }
        
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    func headerTitle(for section: Int) -> String? {
        return nil
    }
    
    func headerHeight(for section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return Constants.headerHeight
        }
    }
    
    func numberOfSections() -> Int {
        guard publicProfile != nil else {
            return 0
        }
        
        return sections.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        let sectionType = sections[section]
        
        switch sectionType {
        case .details:
            return rows.count
        }
    }
}

// MARK: - Navigation
extension ManagerInfoViewModel {
    // MARK: - Public methods
}

// MARK: - Fetch
extension ManagerInfoViewModel {
    // MARK: - Public methods
    /// Get TableViewCellViewModel for IndexPath
    func model(for indexPath: IndexPath) -> CellViewAnyModel? {
        guard let publicProfile = publicProfile else {
            return nil
        }
        
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .details:
            let rowType = rows[indexPath.row]
            switch rowType {
            case .header:
                return ManagerTableViewCellViewModel(profile: publicProfile, selectable: false)
            case .info:
                guard let assets = publicProfile.assets else { return nil }
                return  DefaultTableViewCellViewModel(title: "Assets", subtitle: assets.joined(separator: " | "))
            case .about:
                guard let about = publicProfile.about else { return nil }
                return DefaultTableViewCellViewModel(title: "About", subtitle: about)
            }
        }
    }
    
    func fetch(completion: @escaping CompletionBlock) {
        UsersDataProvider.get(with: self.managerId, completion: { [weak self] (viewModel) in
            guard viewModel != nil else {
                return completion(.failure(errorType: .apiError(message: nil)))
            }
            
            self?.publicProfile = viewModel
            
            completion(.success)
            }, errorCompletion: completion)
    }
    
    func updateDetails(with publicProfile: PublicProfile) {
        self.publicProfile = publicProfile
        self.delegate?.didReload()
    }
}

extension ManagerInfoViewModel: ReloadDataProtocol {
    func didReloadData() {
        fetch { [weak self] (result) in
            self?.delegate?.didReload()
        }
    }
}
