//
//  AddTableViewController.swift
//  FinalExam
//
//  Created by 楷岷 張 on 2017/4/28.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        checkInputText(name: nameText.text!, address: addressText.text!, photo: setImage!, url: urlText.text!, detail: detailText.text!, phone: phoneText.text!)
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addImage(_ sender: UIButton) {
        UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var detailText: UITextField!
    
    var setImage:UIImage?
    
    let book = FIRDatabase.database().reference().child("Book")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        addressText.delegate = self
        phoneText.delegate = self
        urlText.delegate = self
        detailText.delegate = self

       nameText.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameText {
            addressText.becomeFirstResponder()
            return false
        } else if textField == addressText {
            phoneText.becomeFirstResponder()
            return false
        } else if textField == phoneText {
            urlText.becomeFirstResponder()
            return false
        } else if textField == urlText {
            detailText.becomeFirstResponder()
            return false
        } else if textField == detailText {
            detailText.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    func checkInputText(name:String, address:String, photo:UIImage, url:String, detail:String, phone:String) {
        if name != "" && address != "" && photo != nil && url != "" && detail != "" && phone != ""{
            pushDataToFireBase(name: name, address: address, photo: photo, url: url, detail: detail, phone: phone)
        } else {
            let alert = UIAlertController(title: "請輸入完整內容", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func pushDataToFireBase(name:String, address:String, photo:UIImage, url:String, detail:String, phone:String) {
        let imageFilePath = "\(FIRAuth.auth()?.currentUser?.uid)/\(NSDate.timeIntervalSinceReferenceDate)"
        let data = UIImageJPEGRepresentation(photo, 0.5)
        let metaData = FIRStorageMetadata()
        FIRStorage.storage().reference().child(imageFilePath).put(data!, metadata: metaData) { (metadata, error) in
            if error != nil {
                return
            } else {
                let fileURL = metadata?.downloadURLs?[0].absoluteString
                let newId = self.book.childByAutoId()
                let bookData = ["name": name, "address": address, "photo": fileURL!, "phone": phone, "url": url, "detail": detail]
                newId.setValue(bookData)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            bookImage.image = picture
            bookImage.clipsToBounds = true
            setImage = picture
            
        }
        dismiss(animated: true, completion: nil)
    }
    
}
