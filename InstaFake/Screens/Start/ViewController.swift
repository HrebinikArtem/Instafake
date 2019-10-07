//
//  ViewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var registerButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Decorator.decorate(vc: self)
        addtargets()
    }
    
    private func addtargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped(sender:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped(sender: UIButton) {
        StartRouter.shared.goToLoginScreen(from: self)
    }
    
    @objc private func registerButtonTapped(sender: UIButton) {
        StartRouter.shared.goToRegisterScreen(from: self)
    }
}


extension ViewController {
    final private class Decorator {
        private init() {}
        
        static func decorate(vc: ViewController) {
            vc.loginButton.layer.borderColor = UIColor.white.cgColor
            vc.loginButton.layer.cornerRadius = 8
            vc.loginButton.layer.borderWidth = 1

            vc.registerButton.layer.borderColor = UIColor.white.cgColor
            vc.registerButton.layer.cornerRadius = 8
            vc.registerButton.layer.borderWidth = 1
            
        }
    }
}
