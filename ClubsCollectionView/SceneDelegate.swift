//
//  SceneDelegate.swift
//  ClubsCollectionView
//
//  Created by tobi adegoroye on 25/05/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene{
            
            let window = UIWindow(windowScene: windowScene)
            let random = LeaugeViewController()
            let navigation = UINavigationController(rootViewController: random)
            window.rootViewController = navigation
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

