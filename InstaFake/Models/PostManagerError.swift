//
//  CustomError.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

enum PostManagerError {
    case notExistError
    case unknownError
}

extension PostManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notExistError:
            return NSLocalizedString("Post_model_not_dictionary", comment: "")
        case .unknownError:
            return NSLocalizedString("server_error", comment: "")
        }
    }
}
