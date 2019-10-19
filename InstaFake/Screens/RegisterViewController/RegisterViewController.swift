//
//  RegisterViewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/4/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit
import ARSLineProgress

class RegisterViewController: UIViewController {

    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    
    private var registerModel = RegisterModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Decorator.decorate(vc: self)
        addTargets()
        updateRegisterButtonStatus()
        title = "Регистрация" 
    }
    
    private func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped(sender:)), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(emailTextChanged(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextChanged(sender:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(nameTextChanged(sender:)), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(usernameTextChanged(sender:)), for: .editingChanged)
    }
    
    private func updateRegisterButtonStatus() {
        registerButton.isEnabled = registerModel.isFilled
    }
    
    @objc private func registerButtonTapped(sender: UIButton) {
        guard registerModel.isFilled else {
            showAlert(with: "Ошибка!", and: "Заполните поля")
            return
        }
        
        ARSLineProgress.show()
        Authmanager.shared.register(with: registerModel) { result in
            ARSLineProgress.hide()
            
            switch result {
            case .success(_):
                StartRouter.shared.routeAfterSuccessAuth(from: self)
                SecureStorageManager.shared.save(email: self.registerModel.email, password: self.registerModel.password, completion: { (res) in
                    switch res {
                    case .success(_):
                        print("keycain saved - success ")
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                })
            case .failure(let error):
                self.showAlert(with: "Error!", and: "Descrpiption:" + error.localizedDescription)
            }
        }
    }
    
    @objc private func emailTextChanged(sender: UITextField) {
        registerModel.email = sender.text ?? ""
        updateRegisterButtonStatus()
    }
    @objc private func passwordTextChanged(sender: UITextField) {
        registerModel.password = sender.text ?? ""
        updateRegisterButtonStatus()
    }
    @objc private func nameTextChanged(sender: UITextField) {
        registerModel.name = sender.text ?? ""
        updateRegisterButtonStatus()
    }
    @objc private func usernameTextChanged(sender: UITextField) {
        registerModel.username = sender.text ?? ""
        updateRegisterButtonStatus()
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
