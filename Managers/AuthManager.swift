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

class Authmanager {
    static let shared = Authmanager()
    private init() {}
    
    var curentUser: User?
    
    private var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    
    private let auth = Auth.auth()
    
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
        
        let usersRef = sourceRef.child(Keys.users.rawValue)
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
          
            if let error = error {
                completion(.failure(error))
            
            } else if let _ = result {
                usersRef.child(model.id).setValue(model.dict)
                completion(.success(()))
            
            } else {
                completion(.failure(RegisterError.unknownError))
            }
        }
    }
}

extension Authmanager {
    private enum Keys: String {
        case users
    }
}

