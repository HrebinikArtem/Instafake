//
//  RegisterViewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(vc: self)
        addTargets()
    }
    
    private func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped(sender: UIButton) {}
}

extension RegisterViewController {
    final private class Decorator {
        private init() {}
        
        static func decorate(vc: RegisterViewController) {
            vc.registerButton.layer.borderWidth = 1
            vc.registerButton.layer.borderColor = UIColor.white.cgColor
            vc.registerButton.layer.cornerRadius = 8
        }
    }
}
