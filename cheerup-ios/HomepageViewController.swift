import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage


class HomepageViewController: UIViewController, GADBannerViewDelegate {
    @IBOutlet var bannerView: GADBannerView!

    var ref : DatabaseReference!
    var imagePicker: UIImagePickerController!
    var photoURL : URL!
    @IBOutlet var cheerupImage: UIImageView!
    @IBOutlet var cheerupText: UITextField!
    
    @IBAction func settingsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSettings", sender: self)
    }
    
    @IBAction func cheerupsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toCheerups", sender: self)
    }

    
    @IBAction func submitCheerup(_ sender: Any) {
        
        self.uploadProfileImageAndCheerup(self.cheerupImage.image!) {
            url in
            let cheerupPost = [
                "post": self.cheerupText?.text,
                "photoURL": url?.absoluteString
                ] as [String : Any]
            
            self.ref.child("posts").child(self.cheerupText.text!).setValue(cheerupPost)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
bannerView.adUnitID = "ca-app-pub-1001703997484038/9885910687"
bannerView.rootViewController = self
        bannerView.load(GADRequest())
bannerView.delegate = self

        ref = Database.database().reference()
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func selectImage(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func uploadProfileImageAndCheerup(_ image: UIImage, completion: @escaping ((_ url: URL?)->())) {
        var imageName = self.cheerupText.text
        
        let storageRef = Storage.storage().reference().child("\(imageName!)")
        //    let metaData = StorageMetadata()
        //   metaData.contentType = "image/jpg"
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        
        storageRef.putData(imageData, metadata: nil) {
            metadata, error in
            guard let metadata = metadata else {
                return
            }
            storageRef.downloadURL{
                (url, error) in
                if let downloadURL = url
                { completion(url) } else {
                    completion(nil)
                }
            }
        }
    }
    @IBAction func seeCheerup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}



extension HomepageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.cheerupImage.image = pickedImage
            self.photoURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

