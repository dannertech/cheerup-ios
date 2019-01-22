//
//  LoginViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 12/14/18.
//  Copyright © 2018 Danner Opp., LLC. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginSubmit(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) {
            user, error in
            if error == nil && user != nil {
                //  self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "fromLoginToPosts", sender: self)
                print("success")
            } else {
                print("Error logging in \(error!.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
