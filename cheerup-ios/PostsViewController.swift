//
//  PostsViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 12/26/18.
//  Copyright © 2018 Danner Opp., LLC. All rights reserved.
//

import UIKit
import Firebase



class PostsViewController: UIViewController {
    
    @IBOutlet var postsImage: UIImageView!
    
    @IBAction func fromCheerupsToSettings(_ sender: Any) {
        self.performSegue(withIdentifier: "fromCheerupsToSettings", sender: self)
    }
    
    @IBAction func fromCheerupsToHomepage(_ sender: Any) {
        self.performSegue(withIdentifier: "fromCheerupsToHomepage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storage = Storage.storage()
        
    let storageRef = storage.reference()
        // Do any additional setup after loading the view.
            let gsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/cheerup-326b3.appspot.com/o/posts?alt=media&token=391e396a-749c-412b-9e13-a6752991028e")
        
        gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error)
            } else {
                let image = UIImage(data: data!)
                self.postsImage.image = image
            }
        }
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
