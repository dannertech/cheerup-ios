//
//  SignupViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 12/14/18.
//  Copyright © 2018 Danner Opp., LLC. All rights reserved.
//

import UIKit
import Firebase
//forgot to mention to add FirebaseAuth


class SignupViewController: UIViewController {
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    var imagePicker : UIImagePickerController!
    

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    @IBAction func handleSignup(_ sender: Any) {
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else { return }
            print(authResult as Any) 
            }
        self.performSegue(withIdentifier: "fromSignupToCheerups", sender: self)
    }
    

}
