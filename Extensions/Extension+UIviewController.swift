//
//  Extension+UIviewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/6/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

