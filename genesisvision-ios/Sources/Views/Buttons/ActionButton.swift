//
//  ActionButton.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 22.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit.UIButton

enum DateRangeButtonType {
    case selected
    case unselected
}

class DateRangeButton: ActionButton {
    
    var dateRangeButtonType: DateRangeButtonType = .unselected {
        didSet {
            switch dateRangeButtonType {
            case .selected:
                bgColor = UIColor.primary
                textColor = UIColor.Common.lightTextPrimary
            case .unselected:
                bgColor = UIColor.Cell.bg
                textColor = UIColor.Cell.subtitle
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerRadius = 16
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cornerRadius = 16
        dateRangeButtonType = isSelected ? .selected : .unselected
    }
}

class ActionButton: UIButton {
    
    var cornerSize: CGFloat = Constants.SystemSizes.cornerSize
    var borderSize: CGFloat = 0.0
    var customBorderColor: UIColor? = .white
    var borderAlpha: CGFloat = 1.0
    var fontSize: CGFloat = 14.0
    var bgColor: UIColor = UIColor.Button.primary
    var textColor: UIColor = UIColor.Font.white
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = cornerSize
        layer.borderColor = customBorderColor?.withAlphaComponent(borderAlpha).cgColor
        layer.borderWidth = borderSize
        layer.masksToBounds = true
        
        titleLabel?.font = UIFont.getFont(.bold, size: fontSize)
        setTitleColor(textColor, for: .normal)
        
        backgroundColor = isUserInteractionEnabled ? bgColor : bgColor.withAlphaComponent(0.3)
    }
    
    func addShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 6.0
        layer.masksToBounds = true
    }
    
    func setEnabled(_ value: Bool) {
        isUserInteractionEnabled = value
        backgroundColor = isUserInteractionEnabled ? bgColor : bgColor.withAlphaComponent(0.3)
    }
}
