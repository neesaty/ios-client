//
//  InRequestsTableViewCell.swift
//  genesisvision-ios
//
//  Created by George on 13/09/2018.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class InRequestsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var redBackgroundView: UIView! {
        didSet {
            redBackgroundView.backgroundColor = UIColor.Cell.redTitle
        }
    }
    @IBOutlet weak var contentBackgroundView: UIView! {
        didSet {
            contentBackgroundView.backgroundColor = UIColor.Cell.bg
        }
    }
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.roundCorners()
        }
    }
    
    @IBOutlet weak var typeImageView: UIImageView! {
        didSet {
            typeImageView.roundCorners()
        }
    }
    
    @IBOutlet weak var titleLabel: TitleLabel! {
        didSet {
            titleLabel.font = UIFont.getFont(.regular, size: 14.0)
            titleLabel.textColor = UIColor.Cell.title
        }
    }
    
    @IBOutlet weak var statusLabel: SubtitleLabel! {
        didSet {
            statusLabel.font = UIFont.getFont(.regular, size: 12.0)
            statusLabel.textColor = UIColor.Cell.subtitle
        }
    }
    
    @IBOutlet weak var amountValueLabel: TitleLabel! {
        didSet {
            amountValueLabel.font = UIFont.getFont(.semibold, size: 14.0)
            amountValueLabel.textColor = UIColor.Cell.title
        }
    }
    
    @IBOutlet weak var dateLabel: SubtitleLabel! {
        didSet {
            dateLabel.font = UIFont.getFont(.regular, size: 12.0)
            dateLabel.textColor = UIColor.Cell.subtitle
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.Cell.bg
        backgroundColor = UIColor.Cell.bg
        tintColor = UIColor.Cell.title
        accessoryView?.backgroundColor = UIColor.Cell.bg
        
        selectionStyle = .none
        
        animateSwipeHint()
    }
    
    func animateSwipeHint() {
        slideFromRight()
    }
    
    func slideFromRight() {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut], animations: {
            self.contentBackgroundView.transform = CGAffineTransform(translationX: -50, y: 0)
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
                self.contentBackgroundView.transform = CGAffineTransform.identity
            }) { (success) in
                
            }
        }
    }
}
