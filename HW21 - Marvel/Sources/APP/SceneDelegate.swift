//
//  SceneDelegate.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 03.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewCintroller = ViewController()
        let navigationController = UINavigationController(rootViewController: viewCintroller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

