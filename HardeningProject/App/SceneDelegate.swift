//
//  SceneDelegate.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
//        if Auth.auth().currentUser == nil {
//            window?.rootViewController = MainTabBar()
//        } else {
//            window?.rootViewController = MainTabBar()
//        }
        window?.rootViewController = FirstStageMarkController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
