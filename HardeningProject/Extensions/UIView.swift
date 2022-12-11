//
//  UIView + Ext.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class ViewForMark: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
        backgroundColor = .specialViewBackground
    }
}
