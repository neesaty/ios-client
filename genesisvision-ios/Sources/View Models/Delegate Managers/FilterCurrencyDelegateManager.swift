//
//  FilterCurrencyDelegateManager.swift
//  genesisvision-ios
//
//  Created by George on 09/11/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UITableView

protocol FilterCurrencyDelegateManagerProtocol: class {
    func didSelectFilterCurrency(at indexPath: IndexPath)
}

final class FilterCurrencyDelegateManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Variables
    weak var delegate: FilterCurrencyDelegateManagerProtocol?
    
    var tableView: UITableView?
    var currencies: [PlatformCurrency] = []
    private var selectedIndex: Int = 0
    
    var cellModelsForRegistration: [CellViewAnyModel.Type] {
        return [DashboardCurrencyTableViewCellViewModel.self]
    }
    
    // MARK: - Lifecycle
    override init() {
        super.init()
    }
    
    // MARK: - Public methods
    func reset() {
        selectedIndex = 0
    }
    
    func getSelectedCurrencyValue() -> String? {
        guard currencies.count > 0 else {
            return nil
        }
        
        return currencies[selectedIndex].name
    }
    
    func loadCurrencies() {
        PlatformManager.shared.getPlatformInfo { (platformInfo) in
            guard let platformInfo = platformInfo else { return }
            
            if let platformCurrencies = platformInfo.platformCurrencies {
                self.currencies = platformCurrencies
                self.updateSelectedIndex()
                self.tableView?.reloadData()
            }
        }
    }
    
    func updateSelectedIndex() {
        let selectedCurrency = getSelectedCurrency()
        self.selectedIndex = currencies.firstIndex(where: { return $0.name == selectedCurrency } ) ?? 0
    }
    
    // MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let selectedCurrency = currencies[indexPath.row].name {
            updateSelectedCurrency(selectedCurrency)
            self.selectedIndex = indexPath.row
        }
        
        delegate?.didSelectFilterCurrency(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCurrencyTableViewCell", for: indexPath) as? DashboardCurrencyTableViewCell else {
            let cell = UITableViewCell()
            return cell
        }
        
        let isSelected = indexPath.row == selectedIndex
        let currency = currencies[indexPath.row]
        let currencyValue = currency.name ?? ""
        
        cell.configure(title: currencyValue, subtitle: nil, selected: isSelected)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor.Cell.subtitle.withAlphaComponent(0.3)
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor.Cell.bg
        }
    }
}

