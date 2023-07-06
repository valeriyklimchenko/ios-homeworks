//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        //Создаем window
        let window = UIWindow(windowScene: scene)
        
        //Создаем навигационные контроллеры и устанавливаем для них корневые контентные контроллеры
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let profileViewController = UINavigationController(rootViewController: LogInViewController())
//        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.title = "Profile"
        
        profileViewController.tabBarItem.image = UIImage(systemName: "person.fill")

        
        //Создаем TabBAr
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [profileViewController, feedViewController]

        tabBarController.tabBarItem.title = "title"
        tabBarController.tabBar.backgroundColor = UIColor.systemGray
        tabBarController.tabBar.tintColor = UIColor.systemBlue
        
        //Устанавливаем TabBar в качестве корневого
        window.rootViewController = tabBarController
        
        
        //Делаем окно главным и видимым
        window.makeKeyAndVisible()
        self.window = window
        
    }
}

