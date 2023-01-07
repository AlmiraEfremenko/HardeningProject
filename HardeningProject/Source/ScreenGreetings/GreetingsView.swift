//
//  GreetingsView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class GreetingsView: UIView {
    
    // MARK: - Property
    
    private lazy var isChoiceCheckBox = false
    
    private let labelGreetings = UILabel(text: "Добро пожаловать!",
                                         
                                         textAlignment: .center,
                                         color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    private lazy var imageHardening: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "смешно")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 18
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var answerQuestionsAboutHealth: UILabel = {
        var label = UILabel()
        label.text = "Здесь ты познаешь методику закаливания, но перед началом ответь на вопросы"
        label.numberOfLines = 2
        label.addInterlineSpacing()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var idont: UILabel = {
        var label = UILabel()
        label.text = "Я не:"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textAboutHealthHeart: UILabel = {
        var label = UILabel()
        label.text = "Болею сердечно-сосудистыми заболеваниями"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textAboutHealth: UILabel = {
        var label = UILabel()
        label.text = "Болел в течении 3-х недель"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonCheckAboutHealthHeart: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapCheckBoxHealthHeart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonCheckAboutHealth: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapCheckBoxAboutHeart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonProceed = StartOrFollowButton(text: "Продолжить")
   
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        
        buttonProceed.addTarget(self, action: #selector(followToScreenStageHardening), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        addSubview(labelGreetings)
        addSubview(imageHardening)
        addSubview(answerQuestionsAboutHealth)
        addSubview(idont)
        addSubview(buttonCheckAboutHealthHeart)
        addSubview(buttonCheckAboutHealth)
        addSubview(textAboutHealthHeart)
        addSubview(textAboutHealth)
        addSubview(buttonProceed)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
        
            labelGreetings.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelGreetings.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            
            imageHardening.topAnchor.constraint(equalTo: labelGreetings.bottomAnchor, constant: 30),
            imageHardening.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageHardening.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageHardening.heightAnchor.constraint(equalToConstant: 200),
            
            answerQuestionsAboutHealth.centerXAnchor.constraint(equalTo: centerXAnchor),
            answerQuestionsAboutHealth.topAnchor.constraint(equalTo: imageHardening.bottomAnchor, constant: 30),
            answerQuestionsAboutHealth.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            answerQuestionsAboutHealth.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            idont.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            idont.topAnchor.constraint(equalTo: answerQuestionsAboutHealth.bottomAnchor, constant: 35),
            
            buttonCheckAboutHealthHeart.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonCheckAboutHealthHeart.topAnchor.constraint(equalTo: idont.bottomAnchor, constant: 30),
            buttonCheckAboutHealthHeart.widthAnchor.constraint(equalToConstant: 30),
            buttonCheckAboutHealthHeart.heightAnchor.constraint(equalToConstant: 30),
            
            buttonCheckAboutHealth.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonCheckAboutHealth.topAnchor.constraint(equalTo: buttonCheckAboutHealthHeart.bottomAnchor, constant: 30),
            buttonCheckAboutHealth.widthAnchor.constraint(equalToConstant: 30),
            buttonCheckAboutHealth.heightAnchor.constraint(equalToConstant: 30),
            
            textAboutHealthHeart.leadingAnchor.constraint(equalTo: buttonCheckAboutHealthHeart.trailingAnchor, constant: 13),
            textAboutHealthHeart.topAnchor.constraint(equalTo: idont.bottomAnchor, constant: 25),
            textAboutHealthHeart.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textAboutHealth.leadingAnchor.constraint(equalTo: buttonCheckAboutHealth.trailingAnchor, constant: 13),
            textAboutHealth.topAnchor.constraint(equalTo: textAboutHealthHeart.bottomAnchor, constant: 20),
            textAboutHealth.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            buttonProceed.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonProceed.topAnchor.constraint(equalTo: textAboutHealth.bottomAnchor,constant: 40),
            buttonProceed.heightAnchor.constraint(equalToConstant: 55),
            buttonProceed.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1)
            ])
    }
    
    // MARK: - func tapCheckBoxHealthHeart
    
    @objc func tapCheckBoxHealthHeart() {
        
        isChoiceCheckBox = !isChoiceCheckBox
        
        if isChoiceCheckBox {
            buttonCheckAboutHealthHeart.setImage(UIImage(systemName: "checkmark")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            buttonCheckAboutHealthHeart.backgroundColor = UIColor(red: 91/255.0, green: 182/255, blue: 185/255.0, alpha: 1.0)
            
            
        } else {
            buttonCheckAboutHealthHeart.setImage(UIImage(systemName: ""), for: .normal)
            buttonCheckAboutHealthHeart.backgroundColor = .systemGray5
           
        }
    }
    
    // MARK: - func tapCheckBoxAboutHeart
    
    @objc func tapCheckBoxAboutHeart() {
        
        isChoiceCheckBox = !isChoiceCheckBox
        
        if isChoiceCheckBox {
            
            buttonCheckAboutHealth.setImage(UIImage(systemName: "checkmark")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            buttonCheckAboutHealth.backgroundColor = UIColor(red: 91/255.0, green: 182/255, blue: 185/255.0, alpha: 1.0)
        
        } else {
            buttonCheckAboutHealth.setImage(UIImage(systemName: ""), for: .normal)
            buttonCheckAboutHealth.backgroundColor = .systemGray5
        }
    }
    
    // MARK: - func tapCheckBoxAboutHeart
    
    var followScreenStageHardening: (()-> Void)?
    
    @objc func followToScreenStageHardening() {
        
        if isChoiceCheckBox {
            followScreenStageHardening?()
        }
    }
}

