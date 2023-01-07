//
//  UIButton + Ext.swift
//  HardeningProject
//
//  Created by MAC on 23.12.2022.
//

import UIKit

extension UIButton {

    convenience init(title: String) {
        self.init(type: .system)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
    }
}
