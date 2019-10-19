//
//  CreatePostViewController.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    private func addTargets() {
        doneButton.addTarget(self, action: #selector(doneButtonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc private func doneButtonClicked(sender: UIButton) {
     
        guard let text = textview.text, !text.isEmpty else {
            showAlert(with: "Error", and: "Text is empty")
            return
        }
        
        guard let user = Authmanager.shared.curentUser else {
            showAlert(with: "Error", and: "User is not logged in!")
            return }
        
        PostManager.shared.createPost(from: user, with: text) { (result) in
            switch result {
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            case .success(_):
                self.showAlert(with: "Success", and: "Post has been created")
            }
        }
    }
}
