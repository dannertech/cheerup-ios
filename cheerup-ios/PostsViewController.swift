//
//  PostsViewController.swift
//  cheerup-ios
//
//  Created by Diamonique Danner on 12/26/18.
//  Copyright © 2018 Danner Opp., LLC. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
import GoogleMobileAds


class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate {
    var postDictionary : NSDictionary?
    var currentPost : String?
    var postData = [Cheerup]()
    
    
    
    @IBOutlet var postsImage: UIImageView!
    @IBOutlet var postsTable: UITableView!
    
    @IBOutlet var postText: UILabel!
    
    
    
    
    @IBAction func fromCheerupsToSettings(_ sender: Any) {
        self.performSegue(withIdentifier: "fromCheerupsToSettings", sender: self)
    }
    
    @IBAction func fromCheerupsToHomepage(_ sender: Any) {
        self.performSegue(withIdentifier: "fromCheerupsToHomepage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        let postsRef = Database.database().reference().child("posts")
        postsRef.observeSingleEvent(of: .value, with: {
            (snapshot) in
            //        guard let value = snapshot.value as? [String:Any?] else { return }
            //       guard let json = value["posts"] as? [String:Any?] else { return }
            let allPosts = snapshot.children.allObjects as! [DataSnapshot]
            
            for postSnap in allPosts {
                let postKey = postSnap.key
                let postText = postSnap.childSnapshot(forPath: "post").value as! String
                let photoURL = postSnap.childSnapshot(forPath: "photoURL").value as! String
                let aPost = Cheerup(withKey: postKey, andPost: postText, andPhoto: photoURL)
                self.postData.append(aPost)
                
            }
            self.postsTable.reloadData()
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        
        postsTable.dataSource = self
        postsTable.delegate = self
        
        
        
        
        
        // Do any additional setup after loading the view.
        // let gsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/cheerup-326b3.appspot.com/o/posts?alt=media&token=391e396a-749c-412b-9e13-a6752991028e")
        
        /*      gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
         /         if let error = error {
         print(error)
         } else {
         let image = UIImage(data: data!)
         self.postsImage.image = image
         }
         }
         */
        
        
        
    }
   
    
    
    
    @IBAction func logOut(_ sender: Any) {
        
        let firebase = Auth.auth()
        do {
            try firebase.signOut()
        } catch let signOutError as NSError {
            print(signOutError)
        }
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController, animated: true, completion: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.postsTable.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        //  cell.postText.text = String(indexPath.row)
        let data = postData[indexPath.row].post
        let imageURLString = postData[indexPath.row].photoURL
        let imageURL = NSURL(string: imageURLString)
        
        print(data)
        cell.postText.text = data
        let placeholderImage = UIImage(named: "purple-field")
        let imageView = cell.postImage
        imageView?.sd_setImage(with: imageURL as! URL, placeholderImage: placeholderImage)
        
        print(imageURL)
        return cell
    }
}
