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
    var bodyView: UITextView!
    
    var titleString: String!
    var bodyText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Notes"
        
        titleString = document.title
        bodyText = document.body
        
        setUpTitleField()
        setUpBody()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        document.update(title: titleString, body: bodyText)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == self.titleTextField {
            titleString = self.titleTextField.text
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == bodyView {
            bodyText = bodyView.text
        }
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
        bodyView = UITextView(frame: CGRect(x: 10, y: self.titleTextField.frame.maxY + 10, width: self.view.frame.width-20, height: self.view.frame.height - 100))
        bodyView.delegate = self
        
        bodyView.font = UIFont.systemFont(ofSize: 16)
        bodyView.text = document.body
        
        self.view.addSubview(bodyView)
    }
}
