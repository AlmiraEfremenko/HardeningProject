//
//  FirstStageController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class FirstStageHardeningController: UIViewController {
    
    private var firstStageHardeningView: FirstStageHardeningView? {
        guard isViewLoaded else { return nil }
        return view as? FirstStageHardeningView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view = FirstStageHardeningView()
        tapStartMarkHardening()
    }
    
    private func tapStartMarkHardening() {
        firstStageHardeningView?.openFirstStageMark = { [weak self] in
            let firstStageMarkController = FirstStageMarkController()
            self?.navigationController?.pushViewController(firstStageMarkController, animated: false)
        }
    }
}
