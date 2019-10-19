//
//  Post.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import Foundation

class Post: Codable {
    enum PostType: String, Codable {
        case text
        case image
        case textAndImage
    }
    
    var id: String
    var type: PostType
    var text: String?
    var imagedata: Data?
    var dateUnix: TimeInterval
    
    init() {
        self.id = UUID.init().uuidString
        self.dateUnix = Date().timeIntervalSince1970
        self.type = .text
    }
    
    convenience init(text: String) {
        self.init()
        self.type = .text
        self.text = text
    }
}
