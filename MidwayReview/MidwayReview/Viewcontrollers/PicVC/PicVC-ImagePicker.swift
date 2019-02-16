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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.docImage.image = info[.originalImage] as? UIImage
        self.activityIndicator.startAnimating()
        
        imagePicker.dismiss(animated: true, completion: {
            self.readImage()
        })
    }
}
