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
    var docImageView: UIImageView!
    
    var docTextView: UITextView!
    var docTitleField: UITextField!
    
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
        setupImagePicker()
        setupActivityIndicator()
        
        self.toggleInteraction(to: false)
        self.view.backgroundColor = Colors.primaryDark
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.reset()
    }
    
    func readImage() {
        guard let image = docImageView.image else { return }
        guard let scaledImage = image.scaleImage(640) else { return }
        
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.engineMode = .tesseractCubeCombined
            tesseract.pageSegmentationMode = .auto
            tesseract.image = scaledImage.g8_blackAndWhite()
            tesseract.recognize()
            self.docTextView.text = tesseract.recognizedText
        }
        
        activityIndicator.stopAnimating()
        self.toggleInteraction(to: true)
    }
    
    @objc func createDocument() {
        guard var title = self.docTitleField.text else {
            self.showError(titled: "Error", withMessage: "Please enter a title")
            return
        }
        
        if title == "" {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy HH:mm"
            title = formatter.string(from: Date())
        }
        
        let text = docTextView.text
        
        let newDoc = Document.init(withTitle: title, body: text!, createdOn: Date())
        
        DocumentManager.sharedInstance.addDocument(newDoc, completion: {
            DispatchQueue.main.async {
                self.tabBarController?.selectedIndex = 0
            }
        })
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

