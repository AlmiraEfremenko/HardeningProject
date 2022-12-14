//
//  UIButton + Ext.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class StartOrFollowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        setTitleColor(.white, for: .normal)
        backgroundColor = .specialViewBackground
       // layer.borderColor = UIColor.specialTextButton.cgColor
        //layer.borderWidth = 3
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
