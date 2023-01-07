//
//  MainScreenView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class MainScreenView: UIView {
    
    // MARK: - Property
   
    private let titleLarge = UILabel(text: "Выбери подписку и попробуй 7 дней без оплаты",
                                     
                                     textAlignment: .center,
                                     color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    private lazy var titleInCardLeft = configureTitleInCard(text: "1 месяц",
                                                            textColor: .black)
    
    private lazy var titleInCardRight = configureTitleInCard(text: "6 месяцeв",
                                                             textColor: .white)
    
    private lazy var textAboutCostLeft = configureTextAboutCost(text: "379 руб. в месяц",
                                                                textColor: .black)
    
    private lazy var textAboutCostRight = configureTextAboutCost(text: "1050 руб. в месяц",
                                                                 textColor: .white)
    
    private lazy var textAboutRateLeft = configureTextAboutRate(text: "Ежемесячная оплата, первые 7 дней без оплаты",
                                                                textColor: .gray)
    
    private lazy var textAboutRateRight = configureTextAboutRate(text: "Ежемесячная оплата, первые 7 дней без оплаты",
                                                                 textColor: .white)
    
    private lazy var viewCardLeft = configureViewCard(color: .lightGray.withAlphaComponent(0.3))
    private lazy var viewCardRight = configureViewCard(color: UIColor(red: 246.0/255.0, green: 88.0/150.0, blue: 40.0/255.0, alpha: 1.0))
    private lazy var checkBoxLeft = configureButton()
    private lazy var checkBoxRight = configureButton()
    private lazy var isChoiceCheckBox = false
    
    private lazy var buttonProceed = StartOrFollowButton(text: "Продолжить")
    
    private lazy var textCommentAboutSubscription: UILabel = {
        var textCommentAboutSubscription = UILabel()
        textCommentAboutSubscription.font = .systemFont(ofSize: 18, weight: .regular)
        textCommentAboutSubscription.textColor = .black
        textCommentAboutSubscription.text = "Отписаться можно в любой момент"
        textCommentAboutSubscription.textAlignment = .center
        textCommentAboutSubscription.translatesAutoresizingMaskIntoConstraints = false
        return textCommentAboutSubscription
    }()
    
    private lazy var buttonRegistration: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        button.addTarget(self, action: #selector(tapButtonRegistration), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        addSubview(titleLarge)
        addSubview(viewCardLeft)
        addSubview(viewCardRight)
        viewCardLeft.addSubview(titleInCardLeft)
        viewCardLeft.addSubview(textAboutCostLeft)
        viewCardLeft.addSubview(textAboutRateLeft)
        viewCardLeft.addSubview(checkBoxLeft)
        
        viewCardRight.addSubview(titleInCardRight)
        viewCardRight.addSubview(textAboutCostRight)
        viewCardRight.addSubview(textAboutRateRight)
        viewCardRight.addSubview(checkBoxRight)
        
        addSubview(buttonProceed)
        addSubview(textCommentAboutSubscription)
        addSubview(buttonRegistration)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            titleLarge.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            titleLarge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLarge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLarge.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -650),
            
            viewCardLeft.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            viewCardLeft.heightAnchor.constraint(equalToConstant: 300),
            viewCardLeft.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.92 / 2),
            viewCardLeft.topAnchor.constraint(equalTo: titleLarge.bottomAnchor, constant: 40),

            viewCardRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            viewCardRight.heightAnchor.constraint(equalToConstant: 300),
            viewCardRight.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.92 / 2),
            viewCardRight.topAnchor.constraint(equalTo: titleLarge.bottomAnchor, constant: 40),

            buttonProceed.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonProceed.topAnchor.constraint(equalTo: viewCardLeft.bottomAnchor,constant: 35),
            buttonProceed.heightAnchor.constraint(equalToConstant: 55),
            buttonProceed.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),

            titleInCardLeft.centerXAnchor.constraint(equalTo: viewCardLeft.centerXAnchor),
            titleInCardLeft.topAnchor.constraint(equalTo: viewCardLeft.topAnchor, constant: 25),
            
            titleInCardRight.centerXAnchor.constraint(equalTo: viewCardRight.centerXAnchor),
            titleInCardRight.topAnchor.constraint(equalTo: viewCardRight.topAnchor, constant: 25),
            
            textAboutCostLeft.leadingAnchor.constraint(equalTo: viewCardLeft.leadingAnchor, constant: 15),
            textAboutCostLeft.topAnchor.constraint(equalTo: titleInCardLeft.bottomAnchor, constant: 15),
            textAboutCostLeft.trailingAnchor.constraint(equalTo: viewCardLeft.trailingAnchor, constant: -55),
            
            textAboutCostRight.leadingAnchor.constraint(equalTo: viewCardRight.leadingAnchor, constant: 15),
            textAboutCostRight.topAnchor.constraint(equalTo: titleInCardRight.bottomAnchor, constant: 15),
            textAboutCostRight.trailingAnchor.constraint(equalTo: viewCardRight.trailingAnchor, constant: -55),
            
            textAboutRateLeft.leadingAnchor.constraint(equalTo: viewCardLeft.leadingAnchor, constant: 15),
            textAboutRateLeft.topAnchor.constraint(equalTo: textAboutCostLeft.bottomAnchor, constant: 15),
            textAboutRateLeft.trailingAnchor.constraint(equalTo: viewCardLeft.trailingAnchor, constant: -15),
            
            textAboutRateRight.leadingAnchor.constraint(equalTo: viewCardRight.leadingAnchor, constant: 15),
            textAboutRateRight.topAnchor.constraint(equalTo: textAboutCostRight.bottomAnchor, constant: 15),
            textAboutRateRight.trailingAnchor.constraint(equalTo: viewCardRight.trailingAnchor, constant: -15),
            
            checkBoxLeft.leadingAnchor.constraint(equalTo: viewCardLeft.leadingAnchor, constant: 15),
            checkBoxLeft.topAnchor.constraint(equalTo: textAboutRateLeft.bottomAnchor, constant: 20),
            checkBoxLeft.heightAnchor.constraint(equalToConstant: 30),
            checkBoxLeft.widthAnchor.constraint(equalToConstant: 30),
            
            checkBoxRight.leadingAnchor.constraint(equalTo: viewCardRight.leadingAnchor, constant: 15),
            checkBoxRight.topAnchor.constraint(equalTo: textAboutRateRight.bottomAnchor, constant: 20),
            checkBoxRight.heightAnchor.constraint(equalToConstant: 30),
            checkBoxRight.widthAnchor.constraint(equalToConstant: 30),
        
            textCommentAboutSubscription.centerXAnchor.constraint(equalTo: centerXAnchor),
            textCommentAboutSubscription.topAnchor.constraint(equalTo: buttonProceed.bottomAnchor, constant: 15),
            
            buttonRegistration.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonRegistration.topAnchor.constraint(equalTo: buttonProceed.bottomAnchor, constant: 70)
        ])
    }
    
    // MARK: - Action buttons check
    
    @objc func tapCheckBox() {
        
        isChoiceCheckBox = !isChoiceCheckBox
        
        if isChoiceCheckBox {
            checkBoxLeft.setImage(UIImage(systemName: "checkmark")?.withTintColor(UIColor(red: 91/255.0, green: 182/255, blue: 185/255.0, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
            checkBoxRight.setImage(UIImage(systemName: ""), for: .normal)
        } else {
            checkBoxLeft.setImage(UIImage(systemName: ""), for: .normal)
            checkBoxRight.setImage(UIImage(systemName: "checkmark")?.withTintColor(UIColor(red: 91/255.0, green: 182/255, blue: 185/255.0, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    // MARK: - Tap button registration or log in
    
    // closure
    var registrationAction: (() -> Void)?
  
    @objc func tapButtonRegistration() {
        registrationAction?()
    }
    
    // MARK: - Add function labels in card
    
    private func configureTitleInCard(text: String, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = textColor
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func configureTextAboutCost(text: String, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = textColor
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func configureTextAboutRate(text: String, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = textColor
        label.text = text
        label.addInterlineSpacing()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // MARK: - Add function button in card
    
    private func configureButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapCheckBox), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - Add function view card
    
    private func configureViewCard(color: UIColor) -> UIView {
        let viewCard = UIView()
        viewCard.backgroundColor = color
        viewCard.layer.cornerRadius = 5
        viewCard.translatesAutoresizingMaskIntoConstraints = false
        return viewCard
    }
}

