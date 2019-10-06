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
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    
    private var registerModel = RegisterModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorate(vc: self)
        addTargets()
        delegating()
    }
    
    private func delegating() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        usernameTextField.delegate = self
    }
    
    private func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc private func registerButtonTapped(sender: UIButton) {
        guard registerModel.isFilled else {
            showAlert(with: "Ошибка!", and: "Заполните поля")
            return
        }
        showAlert(with: "Успех!", and: "регистрация прошла успешно")
    }
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


extension RegisterViewController: UITextFieldDelegate {
    
}
