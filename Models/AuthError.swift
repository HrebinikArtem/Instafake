//
//  AuthError.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/7/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

enum AuthError {
    case userIsnotExist
    case unknownError
}


extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .userIsnotExist:
            return NSLocalizedString("user_is_not_exist", comment: "")
        case .unknownError:
            return NSLocalizedString("unknown_error", comment: "")
        }
    }
}
