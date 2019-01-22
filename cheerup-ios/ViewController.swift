//
//  ViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 12/14/18.
//  Copyright © 2018 Danner Opp., LLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toPosts", sender: self)
        }
    }


}

