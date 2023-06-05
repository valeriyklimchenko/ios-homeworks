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
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.title = "Profile"
        profileViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        
        let logInViewController = UINavigationController(rootViewController: LogInViewController())
        logInViewController.title = "Profile"
        logInViewController.tabBarItem.image = UIImage(systemName: "person.fill")

        
        //Создаем TabBAr
        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [feedViewController ,profileViewController]
//        tabBarController.viewControllers = [profileViewController, feedViewController]
//        tabBarController.viewControllers = [logInViewController, feedViewController]
        tabBarController.viewControllers = [feedViewController, logInViewController]


        tabBarController.tabBarItem.title = "title"
        tabBarController.tabBar.backgroundColor = UIColor.systemGray6
        tabBarController.tabBar.tintColor = UIColor.systemBlue
        
        //Устанавливаем TabBar в качестве корневого
        window.rootViewController = tabBarController
        
        
        //Делаем окно главным и видимым
        window.makeKeyAndVisible()
        self.window = window
        
    }
}

