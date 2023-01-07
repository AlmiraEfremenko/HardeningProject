//
//  StageHardeningController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class StageHardeningController: UIViewController {
    
    private var stageHardeningView: StageHardeningView? {
        guard isViewLoaded else { return nil }
        return view as? StageHardeningView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.view = StageHardeningView()
        openTabBarHardening()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func openTabBarHardening() {
        self.stageHardeningView?.openTabBarHardening = { [weak self] in
            let firstStageHardeningController = MainTabBar()
            firstStageHardeningController.modalPresentationStyle = .fullScreen
            self?.present(firstStageHardeningController, animated: false)
        }
    }
}

