//
//  MainRouter.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

final class MainRouter {
    
    static let shared = MainRouter()
    private init() {}
    
    func root(_ window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootVC = SecureStorageManager.shared.isLoggedIn() ? startControllerAfterAuth : ViewController()
        
        window?.rootViewController = UINavigationController.init(rootViewController: rootVC)
    }
    
    var startControllerAfterAuth: UIViewController {
        let postVC = CreatePostViewController()
        let postNC = UINavigationController(rootViewController: postVC)
        let postTabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        postNC.tabBarItem = postTabBarItem
        
        let feedVC = FeedViewController()
        let feedNC = UINavigationController(rootViewController: feedVC)
        let feedTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        feedNC.tabBarItem = feedTabBarItem
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([feedNC, postNC], animated: true)
        
        return tabBarVC
    }
}
