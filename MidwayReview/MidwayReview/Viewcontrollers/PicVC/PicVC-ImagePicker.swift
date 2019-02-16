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
        //imagePicker.sourceType = .photoLibrary // Uncomment this when running on the simulator
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // TODO
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // TODO
    }
}
