//
//  ThirdStageMarkViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit

class ThirdStageMarkController: UIViewController {
    
    private var thirdStageMarkView: ThirdStageMarkView? {
        guard isViewLoaded else { return nil }
        return view as? ThirdStageMarkView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ThirdStageMarkView()
    }
}
