//
//  RegisterError.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/7/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

enum RegisterError {
    case invalidEmail
    case unknownError
    case serverError
}

extension RegisterError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("email_is_not_valid", comment: "")
        case .unknownError, .serverError:
            return NSLocalizedString("server_error", comment: "")
        }
    }
}
