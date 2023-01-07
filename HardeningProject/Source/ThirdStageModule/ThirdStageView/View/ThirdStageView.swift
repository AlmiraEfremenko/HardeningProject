//
//  ThirdStageView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class ThirdStageHardeningView: UIView {
    
    // MARK: - Property
    
    private lazy var image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "закаливание3этап")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let title = UILabel(text: "Этап 3",
                              
                                textAlignment: .center,
                                color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    private lazy var dousingWithWater = configuraText(text: "1. Обливание водой",
                                                  ofSize: 27,
                                                  weight: .regular)
    private lazy var outdoorTreatments = configuraText(text: "2. Процедуры на свежем воздухе",
                                                     ofSize: 27,
                                                     weight: .regular)
    
    private lazy var snowRubdown = configuraText(text: "3. Обтирание снегом",
                                                     ofSize: 27,
                                                     weight: .regular)
    
    lazy var buttonStart = StartOrFollowButton(text: "Начать")
    
    var openThirdStageMark: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        
        buttonStart.addTarget(self, action: #selector(tapButtonStart), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(title)
        addSubview(dousingWithWater)
        addSubview(outdoorTreatments)
        addSubview(snowRubdown)
        addSubview(buttonStart)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250),
    
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),

            dousingWithWater.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dousingWithWater.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            dousingWithWater.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            outdoorTreatments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            outdoorTreatments.topAnchor.constraint(equalTo: dousingWithWater.bottomAnchor, constant: 30),
            outdoorTreatments.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            snowRubdown.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            snowRubdown.topAnchor.constraint(equalTo: outdoorTreatments.bottomAnchor, constant: 30),
            snowRubdown.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            buttonStart.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStart.topAnchor.constraint(equalTo: snowRubdown.bottomAnchor,constant: 40),
            buttonStart.heightAnchor.constraint(equalToConstant: 55),
            buttonStart.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),
        ])
    }
    
    // MARK: - configura text instruction
    
    private func configuraText(text: String, ofSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: ofSize, weight: weight)
        label.text = text
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // MARK: - add tap Button Start
    
    @objc func tapButtonStart() {
        self.openThirdStageMark?()
    }
}

