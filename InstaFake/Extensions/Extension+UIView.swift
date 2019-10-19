//
//  Extension+UIView.swift
//  InstaFake
//
//  Created by Artem Grebinik on 10/13/19.
//  Copyright © 2019 Artem Grebinik. All rights reserved.
//

import UIKit

extension UIView {
    func round() {
        layer.cornerRadius = frame.height / 2
    }
}
