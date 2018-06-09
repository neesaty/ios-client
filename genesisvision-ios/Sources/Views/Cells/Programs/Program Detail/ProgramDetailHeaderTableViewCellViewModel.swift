//
//  ProgramDetailHeaderTableViewCellViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 19.02.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import Foundation
import Kingfisher

struct ProgramDetailHeaderTableViewCellViewModel {
    let investmentProgramDetails: InvestmentProgramDetails
    weak var delegate: DetailHeaderTableViewCellProtocol?
}

extension ProgramDetailHeaderTableViewCellViewModel: CellViewModel {
    func setup(on cell: DetailHeaderTableViewCell) {
        if let level = investmentProgramDetails.level {
            cell.programLogoImageView.levelLabel.text = level.toString()
        }
        
        cell.programLogoImageView.profilePhotoImageView.image = UIImage.placeholder
        
        if let logo = investmentProgramDetails.logo {
            let logoURL = getFileURL(fileName: logo)
            cell.programLogoImageView.profilePhotoImageView.kf.indicatorType = .activity
            cell.programLogoImageView.profilePhotoImageView.kf.setImage(with: logoURL, placeholder: UIImage.placeholder)
        }
        
        if let title = investmentProgramDetails.title {
            cell.titleLabel.text = title
        }
        
        if let username = investmentProgramDetails.manager?.username {
            cell.managerLabel.text = "by " + username
        }
        
        if let currency = investmentProgramDetails.currency, let сurrencyType = CurrencyType(currency: currency) {
            cell.currencyLabel.currencyType = сurrencyType
            cell.currencyLabel.text = currency.rawValue.uppercased()
        }
        
        cell.delegate = delegate
    }
}

