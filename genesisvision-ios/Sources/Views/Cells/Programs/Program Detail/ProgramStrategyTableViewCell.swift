//
//  ProgramStrategyTableViewCell.swift
//  genesisvision-ios
//
//  Created by George on 01/10/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class ProgramStrategyTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.Cell.subtitle
            titleLabel.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.textColor = UIColor.Cell.title
            textView.font = UIFont.getFont(.semibold, size: 14.0)
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.Cell.bg
        selectionStyle = .none
    }
}