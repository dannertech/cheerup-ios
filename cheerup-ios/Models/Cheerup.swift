//
//  Cheerup.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 1/23/19.
//  Copyright © 2019 Danner Opp., LLC. All rights reserved.
//

import Foundation

class Cheerup {
    var postKey : String
    var post : String
    var photoURL : String
    
    init(withKey: String, andPost: String, andPhoto: String){
        
        self.postKey = withKey
        self.post = andPost
        self.photoURL = andPhoto
        
    }
    
    
}

