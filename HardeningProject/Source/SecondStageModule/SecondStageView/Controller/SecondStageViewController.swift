//
//  SecondStageMarkViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit

class SecondStageHardeningController: UIViewController {
    
    private var secondStageHardeningView: SecondStageHardeningView? {
        guard isViewLoaded else { return nil }
        return view as? SecondStageHardeningView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = SecondStageHardeningView()
        tapStartSecondStageTracker()
    }
    
    private func tapStartSecondStageTracker() {
        secondStageHardeningView?.openSecondStageTracker = { [weak self] in
           // let secondStageTrackerController = StageTrackerController()
           // self?.navigationController?.pushViewController(secondStageTrackerController, animated: false)
        }
    }

