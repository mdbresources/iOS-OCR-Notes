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
        
        self.view.backgroundColor = Colors.primaryDark
        
        //TODO
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        //TODO
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
        
        // TODO
    }
    
    @objc func createDocument() {
        // TODO Create a document with the data in the fields
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

