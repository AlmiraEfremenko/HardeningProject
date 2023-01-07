//
//  FirstStageView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class FirstStageHardeningView: UIView {
    
    // MARK: - Property
    
    private lazy var image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "закаливание1этап")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let stepNameLabel = UILabel(text: "Первый этап",
                                        textAlignment: .center,
                                        color: .black,
                                        font: .systemFont(ofSize: 25, weight: .bold))
    
    
    
    private var stackView = UIStackView()
    
    private let walkLabel = UILabel(text: "1. Хождение босиком дома",
                                    textAlignment: .left,
                                    color: .black,
                                    font: .systemFont(ofSize: 25, weight: .regular))
    
    private let sleepLabel = UILabel(text: "2. Coн с открытым окном",
                                     textAlignment: .left,
                                     color: .black,
                                     font: .systemFont(ofSize: 25, weight: .regular))
    
    private let washingColdLabel = UILabel(text: "3. Умывание холодной водой",
                                           textAlignment: .left,
                                           color: .black,
                                           font: .systemFont(ofSize: 25, weight: .regular))
    
    private lazy var startButton = StartOrFollowButton(text: "Начать")
    
    var openFirstStageMark: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
        
        startButton.addTarget(self, action: #selector(tapButtonStart), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        
        addSubview(image)
        addSubview(stepNameLabel)
        addSubview(startButton)
        
        stackView = UIStackView(arrangedSubviews: [walkLabel,
                                                   sleepLabel,
                                                   washingColdLabel],
                                axis: .vertical,
                                spacing: 20)
        addSubview(stackView)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250),
            
            stepNameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            stepNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            stepNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            stackView.topAnchor.constraint(equalTo: stepNameLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            walkLabel.heightAnchor.constraint(equalToConstant: 25),
            sleepLabel.heightAnchor.constraint(equalToConstant: 25),
            washingColdLabel.heightAnchor.constraint(equalToConstant: 25),
            
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 40),
            startButton.heightAnchor.constraint(equalToConstant: 55),
            startButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),
        ])
    }
    
    // MARK: - Tap startButton
    
    @objc func tapButtonStart() {
        self.openFirstStageMark?()
    }
}
