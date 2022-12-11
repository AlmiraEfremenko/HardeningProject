//
//  GetCodeView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit

class GetCodeView: UIView {
    
    // MARK: - Property
    
    private let titleEnterCode = UILabel(text: "Введите код из смс",
                                         
                                         textAlignment: .center,
                                         color: .black, font: .systemFont(ofSize: 25, weight: .bold))
    
    lazy var code = createTextField()
    
    lazy var buttonSendCode = StartOrFollowButton(text: "Отправить")
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    var reviewValidateCode: (()-> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        buttonSendCode.addTarget(self, action: #selector(tapButtonSendCode), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Hierarchy
    
    private func setupHierarchy() {
        addSubview(titleEnterCode)
        addSubview(code)
        addSubview(buttonSendCode)
        addSubview(activityIndicator)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            titleEnterCode.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleEnterCode.topAnchor.constraint(equalTo: topAnchor, constant: 170),
            
            code.centerXAnchor.constraint(equalTo: centerXAnchor),
            code.topAnchor.constraint(equalTo: titleEnterCode.bottomAnchor, constant: 70),
            code.widthAnchor.constraint(equalToConstant: 200),
            code.heightAnchor.constraint(equalToConstant: 70),
            
            buttonSendCode.topAnchor.constraint(equalTo: code.bottomAnchor, constant: 70),
            buttonSendCode.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonSendCode.heightAnchor.constraint(equalToConstant: 55),
            buttonSendCode.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1),
            
            activityIndicator.topAnchor.constraint(equalTo: buttonSendCode.bottomAnchor, constant: 20),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 50),
            activityIndicator.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Create config textField
    
    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 25)
        textField.delegate = self
        textField.textContentType = .oneTimeCode
        return textField
    }
    
    // MARK: - Send code
    
    @objc func tapButtonSendCode() {
        
        guard let code = self.code.text else { return }
        
        if !code.isEmpty {
            self.reviewValidateCode?()
        }
    }
}

// MARK: - Create extention config textField

extension GetCodeView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 6
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

