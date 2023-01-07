//
//  ViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class ThirdStageHardeningController: UIViewController {
    
    private var thirdStageHardeningView: ThirdStageHardeningView? {
        guard isViewLoaded else { return nil }
        return view as? ThirdStageHardeningView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.view = ThirdStageHardeningView()
        tapStartMarkHardening()
    }
    
    private func tapStartMarkHardening() {
//        thirdStageHardeningView?.openThirdStageMark = { [weak self] in
//
//        }
    }
}
