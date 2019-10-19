//
//  FirebaseManager.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseManager {

    var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return sourceRef.child(Keys.users.rawValue)
    }
}


extension FirebaseManager {
    private enum Keys: String {
        case users
    }
}
