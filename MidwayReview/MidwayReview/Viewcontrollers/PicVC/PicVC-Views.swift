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
        activityIndicator.center = self.docTextView.center
        activityIndicator.color = Colors.orangeAccent
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
    }
    
    func setUpDocImage() {
        let frame = CGRect(x: self.view.frame.width / 2 - 150, y: 50, width: 300, height: 300)
        docImageView = UIImageView(frame: frame)
        docImageView.image = UIImage(named: "Picture")
        
        //docImage.backgroundColor = Colors.secondaryDark
        docImageView.backgroundColor = .clear
        docImageView.tintColor = Colors.orangeAccent
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(takeImage))
        docImageView.addGestureRecognizer(imageTap)
        docImageView.isUserInteractionEnabled = true
        
        self.view.addSubview(docImageView)
    }
    
    func setUpDocTitle() {
        let frame = CGRect(x: 25, y: self.docImageView.frame.maxY + 20, width: self.view.frame.width - 50, height: 50)
        docTitleField = UITextField(frame: frame)
        self.docTitleField.delegate = self
        self.docTitleField.placeholder = "Please enter a title"
        
        self.docTitleField.backgroundColor = .white
        
        self.view.addSubview(docTitleField)
    }
    
    func setUpDocText() {
        let frame = CGRect(x: 25, y: self.docTitleField.frame.maxY+10, width: self.view.frame.width-50, height: 150)
        docTextView = UITextView(frame: frame)
        self.docTextView.delegate = self
        
        self.docTextView.backgroundColor = .white
        
        self.view.addSubview(docTextView)
    }
    
    func setUpAddButton() {
        let frame = CGRect(x: self.view.frame.width / 2 - 50, y: self.docTextView.frame.maxY + 50, width: 100, height: 50)
        addButton = UIButton(frame: frame)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(createDocument), for: .touchUpInside)
        
        self.addButton.backgroundColor = Colors.orangeAccent
        
        self.view.addSubview(addButton)
    }
    
    func toggleInteraction(to enabled: Bool) {
        self.docTitleField.isUserInteractionEnabled = enabled
        self.docTextView.isUserInteractionEnabled = enabled
        self.addButton.isUserInteractionEnabled = enabled
    }
    
    func showError(titled title: String, withMessage message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    func reset() {
        self.docImageView.image = UIImage(named: "Picture")
        self.docTextView.text = ""
        self.docTitleField.text = nil
        self.toggleInteraction(to: false)
    }
}
