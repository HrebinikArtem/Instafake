//
//  UserHeaderView.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

class UserHeaderView: UIView, NibLoadable {
    
    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarView.round()
    }
}
