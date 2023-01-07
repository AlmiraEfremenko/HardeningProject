//
//  GreetingsViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

class ScreenGreetingsViewController: UIViewController {
    
    private var greetingsView: GreetingsView? {
        guard isViewLoaded else { return nil }
        return view as? GreetingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = GreetingsView()
        greetingsView?.followScreenStageHardening = { [weak self] in
            let stageHardeningController = StageHardeningController()
            stageHardeningController.modalPresentationStyle = .fullScreen
            self?.present(stageHardeningController, animated: false)
        }
    }
}
