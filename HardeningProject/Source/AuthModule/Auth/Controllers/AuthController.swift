//
//  AuthController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    // MARK: - Property
    
    private var authView: AuthView? {
        guard isViewLoaded else { return nil }
        return view as? AuthView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = AuthView()
        openScreenCodeAuth()
    }
    
    // MARK: - Greate func openScreenCodeAuth
    
    private func openScreenCodeAuth() {
        
        authView?.enterCodeAuth = { [weak self] in
            
            guard let numberPhone = self?.authView?.phoneTextField.text else { return }
            
            AuthManager.shared.startAuth(phoneNumber: numberPhone) { [weak self] success in
                guard success else { return }
        
                DispatchQueue.main.async {
                    let getCodeVC = GetCodeViewController()
                    getCodeVC.modalPresentationStyle = .fullScreen
                    self?.present(getCodeVC, animated: false)
                }
            }
        }
    }
}
