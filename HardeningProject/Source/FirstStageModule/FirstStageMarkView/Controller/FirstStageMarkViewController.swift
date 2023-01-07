//
//  FirstStageMark.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class FirstStageMarkController: UIViewController {
    
    private var firstStageMarkView: FirstStageMarkView? {
        guard isViewLoaded else { return nil }
        return view as? FirstStageMarkView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.view = FirstStageMarkView()
        tapOpenSecondStage()
    }
    
    private func tapOpenSecondStage() {
        firstStageMarkView?.toSecondStage = { [weak self] in
            let secondStageViewController = SecondStageHardeningController()
            secondStageViewController.modalPresentationStyle = .fullScreen
            self?.present(secondStageViewController, animated: false)
        }
    }
}
