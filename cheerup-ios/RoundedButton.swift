//
//  RoundedButton.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 1/22/19.
//  Copyright © 2019 Danner Opp., LLC. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
