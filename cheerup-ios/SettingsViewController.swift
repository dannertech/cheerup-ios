//
//  SettingsViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 1/22/19.
//  Copyright © 2019 Danner Opp., LLC. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    
    @IBAction func seeCheerups(_ sender: Any) {
        self.performSegue(withIdentifier: "fromSettingsToCheerups", sender: self)
    }
    
    
    @IBAction func addPost(_ sender: Any) {
        self.performSegue(withIdentifier: "fromSettingsToAdd", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        //self.present(ViewController(), animated: false, completion: nil)
        print("successfully logged out")
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
