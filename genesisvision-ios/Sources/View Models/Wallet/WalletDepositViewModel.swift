//
//  WalletDepositViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 26.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

final class WalletDepositViewModel {
    // MARK: - Variables
    var title: String = "Add funds"
    var labelPlaceholder: String = "0"
    let successText = String.Info.walletCopyAddress
    private var router: WalletDepositRouter!
    
    private var address: String = "" {
        didSet {
            if var qrCode = QRCode(address) {
                qrCode.size = CGSize(width: 300, height: 300)
                qrCode.color = CIColor(cgColor: UIColor.BaseView.bg.cgColor)
                qrCode.backgroundColor = CIColor(cgColor: UIColor.Cell.title.cgColor)
                qrImage = qrCode.image
            }
        }
    }
    
    private var qrImage: UIImage?
    
    var selectedCurrency: WalletData.Currency = .gvt
    
    var walletMultiSummary: WalletMultiSummary?
    var selectedWallet: WalletData? {
        didSet {
            guard let selectedWallet = selectedWallet, let address = selectedWallet.depositAddress else { return }
            
            self.address = address
        }
    }
    var selectedWalletCurrencyIndex: Int = 0
    
    
    // MARK: - Init
    init(withRouter router: WalletDepositRouter, currency: CurrencyType, walletMultiSummary: WalletMultiSummary?) {
        self.router = router
        self.walletMultiSummary = walletMultiSummary
        
        setup(currency: currency)
    }
    
    private func setup(currency: CurrencyType) {
        if let selectedCurrency = WalletData.Currency(rawValue: currency.rawValue) {
            self.selectedCurrency = selectedCurrency
            self.selectedWallet = walletMultiSummary?.wallets?.first(where: { $0.currency == selectedCurrency })
            self.selectedWalletCurrencyIndex = walletMultiSummary?.wallets?.firstIndex(where: { $0.currency == selectedCurrency }) ?? 0
        }
    }
    
    // MARK: - Public methods
    func updateWalletCurrencyIndex(_ selectedIndex: Int) {
        guard let walletMultiSummary = walletMultiSummary,
            let wallets = walletMultiSummary.wallets else { return }
        selectedWallet = wallets[selectedIndex]
        selectedWalletCurrencyIndex = selectedIndex
    }
    
    // MARK: - Picker View Values
    func walletCurrencyValues() -> [String] {
        guard let walletMultiSummary = walletMultiSummary,
            let wallets = walletMultiSummary.wallets else {
                return []
        }
        
        return wallets.map {
            if let description = $0.title, let currency = $0.currency?.rawValue {
                return description + " | " + currency
            }
            
            return ""
        }
    }
    
    func getAddress() -> String {
        return address
    }
    
    func getQRImage() -> UIImage {
        return qrImage ?? UIImage.placeholder
    }
    
    // MARK: - Navigation
    func copy(completion: @escaping CompletionBlock) {
        UIPasteboard.general.string = address
        completion(.success)
    }
}

