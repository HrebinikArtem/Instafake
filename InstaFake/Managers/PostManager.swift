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
    
    func loadingAllPosts(completion: @escaping (Result<[Post], PostManagerError>)-> Void) {
        usersRef.observe(.value) { (snapshot) in
            var result:[Post] = []
            
            guard let value = snapshot.value as? [[AnyHashable:Any]] else {
                completion(.failure(.postNotExist))
                return
            }
            
            for element in value {
                let posts = element[Keys.posts.rawValue] as? [[AnyHashable: Any]]
                
            }
        }
    }
}

extension PostManager {
    private enum Keys: String {
        case posts
    }
}
