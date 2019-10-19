//
//  PostManager.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation
import Firebase

final class PostManager: FirebaseManager {
    
    static let shared = PostManager()
    
    private override init() {}
    
    func createPost(from user: User, with text: String, completion: @escaping (Result<Any, Error>)-> Void) {
       
        let postID = UUID.init().uuidString
        let post = Post(text: text)
        
        guard let dictionary = post.dictionary else {
            completion(.failure(PostManagerError.notExistError))
            return
        }
        

        usersRef.child(user.uid).child(Keys.posts.rawValue).child(postID).setValue(dictionary) { (error, reference) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }
    }
}

extension PostManager {
    private enum Keys: String {
        case posts
    }
}
