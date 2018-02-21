//
//  ProgramInvestViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 21.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class ProgramInvestViewController: BaseViewController {
    
    var viewModel: ProgramInvestViewModel!
    
    // MARK: - TextFields
    @IBOutlet var valueTextField: UITextField!
    
    // MARK: - Labels
    @IBOutlet var amountLabel: UILabel!
    
    // MARK: - Buttons
    @IBOutlet var investButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func investMethod() {
        hideKeyboard()
        showProgressHUD()
        guard let text = valueTextField.text,
            let value = Double(text)
            else { return }
        
        viewModel.invest(with: value) { [weak self]  (result) in
//            self?.hideHUD()
            
            switch result {
            case .success:
                self?.showSuccessHUD()
            case .failure(let reason):
                if reason != nil {
                    self?.showErrorHUD(subtitle: reason)
                }
            }
        }
    }
    
    private func setupUI() {
        viewModel.getAmountText { [weak self] (text) in
            self?.amountLabel.text = text
        }
    }
    
    // MARK: - Actions
    @IBAction func investButtonAction(_ sender: UIButton) {
        investMethod()
    }
}