//
//  DocumentViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    var document: Document!
    
    var titleTextField: UITextField!
    var bodyTextView: UITextView!
    
    //TODO Add any instance variables you think you might need
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Notes"
        
        setUpTitleField()
        setUpBody()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        //TODO
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    
        //TODO Do something when the user is done changing the title
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        //TODO Do something when the user is done editing the document body
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
}

extension DocumentViewController {
    func setUpTitleField() {
        titleTextField = UITextField(frame: CGRect(x: 10, y: 100, width: self.view.bounds.width - 20, height: 50))
        
        titleTextField.text = document.title
        titleTextField.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        self.view.addSubview(titleTextField)
    }
    
    func setUpBody() {
        bodyTextView = UITextView(frame: CGRect(x: 10, y: self.titleTextField.frame.maxY + 10, width: self.view.frame.width-20, height: self.view.frame.height - 100))
        bodyTextView.delegate = self
        
        bodyTextView.font = UIFont.systemFont(ofSize: 16)
        bodyTextView.text = document.body
        
        self.view.addSubview(bodyTextView)
    }
}
