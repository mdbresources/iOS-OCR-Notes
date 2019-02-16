//
//  PicVC-Views.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension PictureViewController {
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = self.docText.center
        activityIndicator.color = Colors.orangeAccent
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
    }
    
    func setUpDocImage() {
        let frame = CGRect(x: self.view.frame.width / 2 - 150, y: 50, width: 300, height: 300)
        docImage = UIImageView(frame: frame)
        docImage.image = UIImage(named: "Picture")
        
        //docImage.backgroundColor = Colors.secondaryDark
        docImage.backgroundColor = .clear
        docImage.tintColor = Colors.orangeAccent
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(takeImage))
        docImage.addGestureRecognizer(imageTap)
        docImage.isUserInteractionEnabled = true
        
        self.view.addSubview(docImage)
    }
    
    func setUpDocTitle() {
        let frame = CGRect(x: 25, y: self.docImage.frame.maxY + 20, width: self.view.frame.width - 50, height: 50)
        docTitle = UITextField(frame: frame)
        self.docTitle.delegate = self
        self.docTitle.placeholder = "Please enter a title"
        
        self.docTitle.backgroundColor = .white
        
        self.view.addSubview(docTitle)
    }
    
    func setUpDocText() {
        let frame = CGRect(x: 25, y: self.docTitle.frame.maxY+10, width: self.view.frame.width-50, height: 150)
        docText = UITextView(frame: frame)
        self.docText.delegate = self
        
        self.docText.backgroundColor = .white
        
        self.view.addSubview(docText)
    }
    
    func setUpAddButton() {
        let frame = CGRect(x: self.view.frame.width / 2 - 50, y: self.docText.frame.maxY + 50, width: 100, height: 50)
        addButton = UIButton(frame: frame)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(createDocument), for: .touchUpInside)
        
        self.addButton.backgroundColor = Colors.orangeAccent
        
        self.view.addSubview(addButton)
    }
    
    func toggleInteraction(to enabled: Bool) {
        self.docTitle.isUserInteractionEnabled = enabled
        self.docText.isUserInteractionEnabled = enabled
        self.addButton.isUserInteractionEnabled = enabled
    }
    
    func showError(titled title: String, withMessage message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    func reset() {
        self.docImage.image = UIImage(named: "Picture")
        self.docText.text = ""
        self.docTitle.text = nil
        self.toggleInteraction(to: false)
    }
}
