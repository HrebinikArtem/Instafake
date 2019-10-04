//
//  StartRouter.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

final class StartRouter {
    private init() {}
    
    static func goToRegisterScreen(from source: UIViewController) {
        let vc = RegisterViewController()
        source.navigationController?.pushViewController(vc, animated: true)
    }
}
