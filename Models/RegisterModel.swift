//
//  RegisterModel.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/6/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

class RegisterModel {
    var email: String?
    var name: String?
    var username: String?
    var password: String?
    
    var isFilled: Bool {
        
        guard !(email ?? "").isEmpty,
            !(name ?? "").isEmpty,
            !(username ?? "").isEmpty,
            !(password ?? "").isEmpty else { return false }
        
        return true
    }
}
