//
//  SecondStageMarkView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class SecondStageHardeningView: UIView {
    
    // MARK:- Property
    
    private lazy var image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named:"закаливание2этап")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    
    private let title = UILabel(text: "Этап 2" ,
                                textAlignment: .center,
                                color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    private lazy var coldTower = configuraText(text: "1. Обтирание мокрым полотенцем",
                                                                   ofSize: 27,
                                                                   weight: .regular)
    private lazy var contrastShower = configuraText(text: "2. Контрасный душ",
                                                                      ofSize: 27,
                                                                      weight: .regular)
    
    private lazy var buttonGo = StartOrFollowButton(text: "Начать")
    
    var openSecondStageTracker: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarch()
        setupLayout()
        
        buttonGo.addTarget(self, action: #selector(tapButtonStart), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarch() {
        addSubview(image)
        addSubview(title)
        addSubview(coldTower)
        addSubview(contrastShower)
        addSubview(buttonGo)
    }
    
    // MARK: - Layout
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: topAnchor,constant: 80),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            coldTower.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coldTower.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            coldTower.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            contrastShower.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contrastShower.topAnchor.constraint(equalTo: coldTower.bottomAnchor, constant: 30),
            contrastShower.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            buttonGo.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonGo.topAnchor.constraint(equalTo: contrastShower.bottomAnchor,constant: 100),
            buttonGo.heightAnchor.constraint(equalToConstant: 55),
            buttonGo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1)
        ])
    }
    
    // MARK: - Configuration Text
    
    private func configuraText(text: String, ofSize: CGFloat, weight: UIFont.Weight) -> UILabel {
            let label = UILabel()
            label.font = .systemFont(ofSize: ofSize, weight: weight)
            label.text = text
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

    // MARK: - Button Start
    
    @objc func tapButtonStart() {
        self.openSecondStageTracker?()
    }
}

