//
//  StorageManagerError.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

enum StorageManagerError {
    case keychainError
    case unknownError
}

extension StorageManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .keychainError:
            return NSLocalizedString("keychain_Error", comment: "")
        case .unknownError:
            return NSLocalizedString("unknown_Error", comment: "")
        }
    }
}
