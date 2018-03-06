//
//  ViewController.swift
//  Day11myCam
//
//  Created by MacStudent on 2018-03-06.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController {

    @IBOutlet var myImage: UIImageView!
    var newMedia : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCameraAction(_ sender: Any) {
        if
            UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker =
            UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            newMedia = true
        }
    }
    
    @IBAction func btnGalleryAction(_ sender: Any) {
        if
            UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum) {
            let imagePicker =
                UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            newMedia = false
        
    }
    }
    
}
    extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
            
            let mediaType  = info[UIImagePickerControllerMediaType] as! NSString
            
            if mediaType.isEqual(to: kUTTypeImage as String){
                let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
                
                myImage.image = image
                
                if (newMedia == true) {
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
                }else if mediaType.isEqual(to: kUTTypeMovie as String) {
                    //code to support video here
                }
            }
        }
        @objc func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
            
            if error != nil {
                let  alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle: UIAlertControllerStyle.alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.dismiss(animated: true, completion: nil)
        }
        
}

