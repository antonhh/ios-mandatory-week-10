//
//  ViewController.swift
//  FirebaseImageDemo
//
//  Created by Anton Haastrup on 13/05/2020.
//  Copyright © 2020 Anton Haastrup. All rights reserved.
//

import UIKit
import Photos
import FirebaseStorage
import Firebase


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
    }

    @IBAction func uploadImageBtn(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
                uploadToFirebase(fileURL: url)
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func uploadToFirebase(fileURL : URL){
        let storage = Storage.storage()
        
        let data = Data()
        
        let storageRef =  storage.reference()
        
        let localFile = fileURL
        
        let photoRef = storageRef.child("uploaded photo 1 ")
        
        let uploadTask = photoRef.putFile(from: localFile, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else{
                print(error?.localizedDescription)
                return
            }
            
            
            print("photo uploaded")
            
        }
        
        
    }
    
}

