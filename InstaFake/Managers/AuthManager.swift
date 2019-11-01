//
//  AuthManager.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/6/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class Authmanager: FirebaseManager {
    static let shared = Authmanager()
    
    private override init() {}
    
    var curentUser: User?
    
    private let auth = Auth.auth()
    
    
    func signInIfNeeded() {
        let credentials = SecureStorageManager.shared.loadFromKeychain()
        
        guard let email = credentials.email, let password = credentials.password else {
            return
        }
        
        signIn(with: email, and: password) {_ in}
    }
    
    func signIn(with email: String, and password: String,  completion: @escaping (Result<Any, Error>)-> Void) {
        
        
        auth.signIn(withEmail: email, password: password) { (authDataResult, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let user = authDataResult?.user else {
                completion(.failure(AuthError.userIsnotExist))
                return
            }
            
            self.curentUser = user
            completion(.success(()))
        }
    }
    
    func register(with model: RegisterModel, completion: @escaping (Result<Any, Error>)-> Void) {
        
        guard model.isFilled else {
            completion(.failure(RegisterError.unknownError))
            return
        }
        
        guard let email = model.email, let password = model.password else {
            completion(.failure(RegisterError.invalidEmail))
            return
        }
        
        let id = model.id
        auth.createUser(withEmail: email, password: password) { (result, error) in
          
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let res = result else {
                completion(.failure(RegisterError.unknownError))
                return
            }
            
            self.curentUser = res.user
            var dict = model.dict
            dict["id"] = id
            self.usersRef.child(res.user.uid).setValue(model.dict)
            completion(.success(()))
        }
    }
}


