//
//  AuthView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit
import FirebaseAuth

class AuthView: UIView {
    
    // MARK: - Property
    
    private lazy var isChoiceCheckBox = false
    private lazy var isFieldsAreFilled = true
    
    private let titleRegistration = UILabel(text: "Войти",
                                            textAlignment: .center,
                                            color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    private lazy var textEnterNumberPhone: UILabel = {
        var label = UILabel()
        label.text = "Введите свой номер телефона"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        var textField = UITextField()
        textField.textColor = .gray
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .systemGray5
        textField.placeholder = "+ 0 000(000) 00 00"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 15,
                                        height: 0))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var checkBox: UIButton = {
        var checkBox = UIButton()
        checkBox.backgroundColor = .white
        checkBox.layer.cornerRadius = 15
        checkBox.layer.borderWidth = 0.3
        checkBox.addTarget(self, action: #selector(tapCheckBox), for: .touchUpInside)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    private lazy var textPersonalData: UILabel = {
        var label = UILabel()
        label.text = "Оставляя свои данные вы соглашаетесь с политикой конфиденциальности"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var buttonGetCode = StartOrFollowButton(text: "Получить код")

    var enterCodeAuth: (()-> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        
        buttonGetCode.addTarget(self, action: #selector(tapButtonGetCodeForAuth), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        addSubview(titleRegistration)
        addSubview(textEnterNumberPhone)
        addSubview(phoneTextField)
        addSubview(checkBox)
        addSubview(textPersonalData)
        addSubview(buttonGetCode)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            titleRegistration.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleRegistration.topAnchor.constraint(equalTo: topAnchor, constant: 170),
            
            textEnterNumberPhone.centerXAnchor.constraint(equalTo: centerXAnchor),
            textEnterNumberPhone.topAnchor.constraint(equalTo: titleRegistration.bottomAnchor, constant: 20),
            
            phoneTextField.topAnchor.constraint(equalTo: textEnterNumberPhone.bottomAnchor, constant: 30),
            phoneTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            phoneTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),
            phoneTextField.heightAnchor.constraint(equalToConstant: 55),
            
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            checkBox.heightAnchor.constraint(equalToConstant: 30),
            checkBox.widthAnchor.constraint(equalToConstant: 30),
            checkBox.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 15),
            
            textPersonalData.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 7),
            textPersonalData.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 12),
            textPersonalData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonGetCode.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonGetCode.topAnchor.constraint(equalTo: textPersonalData.bottomAnchor,constant: 35),
            buttonGetCode.heightAnchor.constraint(equalToConstant: 55),
            buttonGetCode.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),
        ])
    }
    
    // MARK: - Add func button finish auth
    
    @objc func tapButtonGetCodeForAuth() {
        
        if isFieldsAreFilled {
            
            guard let phoneText = phoneTextField.text else { return }
            
            if !phoneText.isEmpty && isChoiceCheckBox {
                self.enterCodeAuth?()
            } else {
                buttonGetCode.isEnabled = true
            }
        }
    }
    
    // MARK: - Add action button
    
    @objc func tapCheckBox() {
        
        isChoiceCheckBox = !isChoiceCheckBox
        
        if isChoiceCheckBox {
            checkBox.setImage(UIImage(systemName: "checkmark")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
            
        } else {
            checkBox.setImage(UIImage(systemName: " "), for: .normal)
        }
    }
}

extension AuthView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet(charactersIn: "+0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

