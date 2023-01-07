//
//  MainScreenViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var mainScreenView: MainScreenView? {
        guard isViewLoaded else { return nil }
        return view as? MainScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = MainScreenView()
        openAuthViewController()
    }
    
    private func openAuthViewController() {
        mainScreenView?.registrationAction = { [weak self] in
            let authViewController = AuthViewController()
            authViewController.modalPresentationStyle = .fullScreen
            self?.present(authViewController, animated: false)
        }
    }
}
