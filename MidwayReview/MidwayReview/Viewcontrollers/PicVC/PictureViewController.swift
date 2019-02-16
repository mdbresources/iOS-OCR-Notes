//
//  SecondViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit
import TesseractOCR

class PictureViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    var docImage: UIImageView!
    
    var docText: UITextView!
    var docTitle: UITextField!
    
    var addButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpDocImage()
        setUpDocTitle()
        setUpDocText()
        setUpAddButton()
        
        self.toggleInteraction(to: false)
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        //imagePicker.sourceType = .photoLibrary
        
        activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        self.view.addSubview(activityIndicator)
    }
    
    func readImage() {
        guard let image = docImage.image else { return }
        guard let scaledImage = image.scaleImage(640) else { return }
        
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.engineMode = .tesseractCubeCombined
            tesseract.pageSegmentationMode = .auto
            tesseract.image = scaledImage.g8_blackAndWhite()
            tesseract.recognize()
            self.docText.text = tesseract.recognizedText
        }
        
        activityIndicator.stopAnimating()
        self.toggleInteraction(to: true)
    }
    
    @objc func createDocument() {
        guard let title = self.docTitle.text else {
            self.showError(titled: "Error", withMessage: "Please enter a title")
            return
        }
        
        let text = docText.text
        
        let newDoc = Document.init(withTitle: title, body: text!, createdOn: Date())
        
        DocumentManager.sharedInstance.addDocument(newDoc, completion: nil)
        
        self.reset()
        
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func takeImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

