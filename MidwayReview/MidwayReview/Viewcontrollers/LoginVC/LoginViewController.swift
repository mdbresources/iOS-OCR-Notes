//
//  LoginViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    var emailField: UITextField!
    var passField: UITextField!
    
    //TODO Add any instance variables you think you might need
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupEmailField()
        setupPassField()
        setupLoginButton()
        setupSignupButton()
        setupTitleLabel()
        
        self.view.backgroundColor = Colors.primaryDark
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //TODO
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        //TODO
    }
    
    @objc func checkAuthorization(sender: UIButton) {
        //TODO: Authenticate with Firebase appropriately depending on which button is the sender. Be sure to check your inputs
  
    }
    
    func showError(titled title:String, withMessage message:String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
