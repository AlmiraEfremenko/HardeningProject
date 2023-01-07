//
//  AwardsViewController.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit

class AwardsController: UIViewController {
    
    var awardsView: AwardsView? {
        guard isViewLoaded else { return nil }
        return view as? AwardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = AwardsView()
        // addAwards()
    }
    
    func addAwards() {
        //        let docRef = FirestoreManager.shared.database.document("counter")
        //        docRef.getDocument { snapshot, error in
        //            guard let data = snapshot?.data(), error == nil else { return }
        //            print(data)
        //            DispatchQueue.main.async {
        //                self.awardsView?.labelCounterOneStage.text = data.description
        //            }
    }
}
