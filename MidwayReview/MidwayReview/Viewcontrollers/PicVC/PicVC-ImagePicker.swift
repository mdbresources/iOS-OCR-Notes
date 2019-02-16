//
//  PicVC-ImagePicker.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension PictureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setupImagePicker() {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        //imagePicker.sourceType = .photoLibrary
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.activityIndicator.stopAnimating()
        self.docImage.image = UIImage(named: "Picture")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        self.docImage.image = info[.originalImage] as? UIImage
        self.activityIndicator.startAnimating()
        
        imagePicker.dismiss(animated: true, completion: {
            self.readImage()
        })
    }
}
