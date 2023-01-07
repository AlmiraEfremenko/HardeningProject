//
//  MainTabBar.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        //tabBar.backgroundColor = .specialTabBar
        //tabBar.tintColor = .specialDarkGreen
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupItems() {
        let homeVC = FirstStageHardeningController()
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        let awardsVC = AwardsController()
        let usefulVC = UIViewController()
        let profileVC = ProfileViewController()
        
        setViewControllers([homeNavVC, awardsVC, usefulVC, profileVC], animated: true)
        // проверим есть ли items так как setViewControllers опциональное
        guard let items = tabBar.items else { return }
        // можно по индексам так как их будет немного
        items[0].title = "Home"
        items[1].title = "Awards"
        items[2].title = "Useful"
        items[3].title = "Profile"
       
        
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "snow")
        items[2].image = UIImage(systemName: "list.dash.header.rectangle")
        items[3].image = UIImage(systemName: "person.fill")
    }
}

