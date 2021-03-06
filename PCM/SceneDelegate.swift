//
//  SceneDelegate.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 11/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

