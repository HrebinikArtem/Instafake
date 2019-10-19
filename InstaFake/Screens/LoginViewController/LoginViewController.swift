//
//  LoginViewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/7/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit
import ARSLineProgress

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButon: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden( false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Decorator.decorate(vc: self)
        addtargets()
        
        title = "Вход"
    }
    
    private func addtargets() {
        signInButon.addTarget(self, action: #selector(signInButtonTapped(sender:)), for: .touchUpInside)
    } 
    
    @objc private func signInButtonTapped(sender: UIButton) {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        guard !email.isEmpty && !password.isEmpty else {
            showAlert(with: "Error", and: "Заполните поля!")
            return
        }
        
        ARSLineProgress.show()
        Authmanager.shared.signIn(with: email, and: password) { (result) in
            ARSLineProgress.hide()
            switch result {
            case .success(_):
                StartRouter.shared.routeAfterSuccessAuth(from: self)
            case .failure(let error):
                self.showAlert(with: "error", and: error.localizedDescription)
            }
        }
        
    }
}


extension LoginViewController {
    final private class Decorator {
        private init() {}
        
        static func decorate(vc: LoginViewController) {
            vc.signInButon.layer.borderWidth = 1
            vc.signInButon.layer.cornerRadius = 8
            vc.signInButon.layer.borderColor = UIColor.white.cgColor
        }
    }
}
