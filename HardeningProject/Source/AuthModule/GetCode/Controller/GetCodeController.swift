//
//  GetCodeController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit
import FirebaseAuth

class GetCodeViewController: UIViewController {
    
    // MARK: - Property
    
    private var screenGetCodeAuthView: GetCodeView? {
        guard isViewLoaded else { return nil }
        return view as? GetCodeView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        self.view = GetCodeView()
        
        self.screenGetCodeAuthView?.reviewValidateCode = { [weak self] in
            self?.getCodeAuth()
        }
    }
    
    // MARK: - Greate func getCodeAuth
    
    private func getCodeAuth() {
        
        guard let code = self.screenGetCodeAuthView?.code.text else { return }
        
        AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
            guard success else { return }
            
            DispatchQueue.main.async {
                let screenGreetingsVC = ScreenGreetingsViewController()
                screenGreetingsVC.modalPresentationStyle = .fullScreen
                self?.present(screenGreetingsVC, animated: false)
            }
        }
    }
}

