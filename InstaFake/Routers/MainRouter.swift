//
//  MainRouter.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

final class MainRouter {
    func root(_ window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootVC = ViewController()
        window?.rootViewController = UINavigationController.init(rootViewController: rootVC)
    }
}
