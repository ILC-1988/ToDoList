//
//  SceneDelegate.swift
//  ToDoList
//
//  Created by Илья Черницкий on 16.10.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = ToDoViewController(viewModel: ToDoViewModel())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
