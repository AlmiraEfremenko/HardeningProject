//
//  UILabel + Ext.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "", textAlignment: NSTextAlignment, color: UIColor, font: UIFont?) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.textColor = color
        self.font = font
        self.numberOfLines = 2
        self.adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: attributedString.length))
        attributedText = attributedString
    }
}

