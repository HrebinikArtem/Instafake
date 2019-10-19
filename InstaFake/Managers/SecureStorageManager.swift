//
//  SecureStorageManager.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation
import Locksmith

class SecureStorageManager {
    private init() {}
    
    static let shared = SecureStorageManager()
    let userAccountIdentifier = "userAccountIdentifier"
    
    func eraseUserDataIfNeeded(){
        guard isLoggedIn() else {
            return
        }
        try? Locksmith.deleteDataForUserAccount(userAccount: userAccountIdentifier)
    }
    
    
    func save(email: String?, password: String?, completion: (Result<Any,Error>)-> Void) {
        
        guard let email = email, let password = password, !email.isEmpty, !password.isEmpty  else{
            completion(.failure(StorageManagerError.keychainError))
            return }
        
        let data = [
            Keys.email.rawValue: email,
            Keys.password.rawValue: password
        ]
        
        do {
            try Locksmith.saveData(data: data, forUserAccount: userAccountIdentifier)
            completion(.success(()))
        } catch {
            completion(.failure(StorageManagerError.keychainError))
        }
    }
    
    func loadFromKeychain() -> (email: String?, password: String?) {
        let keychainData = Locksmith.loadDataForUserAccount(userAccount: userAccountIdentifier)
        let email = keychainData?[Keys.email.rawValue] as? String ?? nil
        let password = keychainData?[Keys.password.rawValue] as? String ?? nil
        
        return(email: email, password: password)
    }
    
    func isLoggedIn() -> Bool {
        let credentials = loadFromKeychain()
        return credentials.email != nil && credentials.password != nil
    }
}

extension SecureStorageManager {
    private enum Keys: String {
        case email, password
    }
}
