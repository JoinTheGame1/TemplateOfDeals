//
//  SceneDelegate.swift
//  TemplateOfDealsViewer
//
//  Created by Artem Salimyanov on 07.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let rootVC = DealsViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}

