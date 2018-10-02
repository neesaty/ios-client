//
//  ProgramInvestNowTableViewCell.swift
//  genesisvision-ios
//
//  Created by George on 01/10/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class ProgramInvestNowTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.Cell.title
            titleLabel.font = UIFont.getFont(.semibold, size: 18.0)
        }
    }
    @IBOutlet var investValueLabel: UILabel! {
        didSet {
            investValueLabel.textColor = UIColor.Cell.title
            investValueLabel.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    @IBOutlet var entryFeeValueLabel: UILabel! {
        didSet {
            entryFeeValueLabel.textColor = UIColor.Cell.title
            entryFeeValueLabel.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    @IBOutlet var successFeeValueLabel: UILabel! {
        didSet {
            successFeeValueLabel.textColor = UIColor.Cell.title
            successFeeValueLabel.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    @IBOutlet var investTitleLabel: UILabel! {
        didSet {
            investTitleLabel.textColor = UIColor.Cell.subtitle
            investTitleLabel.font = UIFont.getFont(.semibold, size: 12.0)
        }
    }
    @IBOutlet var entryFeeTitleLabel: UILabel! {
        didSet {
            entryFeeTitleLabel.textColor = UIColor.Cell.subtitle
            entryFeeTitleLabel.font = UIFont.getFont(.semibold, size: 12.0)
        }
    }
    @IBOutlet var successFeeTitleLabel: UILabel! {
        didSet {
            successFeeTitleLabel.textColor = UIColor.Cell.subtitle
            successFeeTitleLabel.font = UIFont.getFont(.semibold, size: 12.0)
        }
    }
    
    @IBOutlet var reinvestTitleLabel: UILabel! {
        didSet {
            reinvestTitleLabel.textColor = UIColor.Cell.title
            reinvestTitleLabel.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    
    @IBOutlet var reinvestTooltip: TooltipButton! {
        didSet {
            reinvestTooltip.tooltipText = String.Tooltitps.reinvest
        }
    }
    
    @IBOutlet var reinvestSwitch: UISwitch!
    
    @IBOutlet var investButton: ActionButton!
    
    @IBOutlet var investDescriptionLabel: UILabel! {
        didSet {
            investDescriptionLabel.textColor = UIColor.Cell.subtitle
            investDescriptionLabel.font = UIFont.getFont(.semibold, size: 12.0)
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.Cell.bg
        selectionStyle = .none
    }
    
    // MARK: - Actions
    @IBAction func investButtonAction(_ sender: UIButton) {
        
    }
}