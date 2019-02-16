//
//  LoginVC-Views.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/16/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    func setupTitleLabel() {
        let label = UILabel(frame: CGRect(x: self.view.frame.width / 2 - 125, y: 150, width: 250, height: 50))
        label.text = "OCR Notes"
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.textColor = .white
        self.view.addSubview(label)
    }
    
    func setupEmailField() {
        emailField = UITextField(frame: CGRect(x: 20, y: self.view.frame.height / 2 - 50, width: self.view.frame.width - 40, height: 30))
        
        emailField.placeholder = "Email"
        emailField.delegate = self
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.keyboardType = .emailAddress
        emailField.backgroundColor = .white
        
        self.view.addSubview(self.emailField)
    }
    
    func setupPassField() {
        passField = UITextField(frame: CGRect(x: 20, y: self.emailField.frame.maxY + 20, width: self.view.frame.width - 40, height: 30))
        
        passField.placeholder = "Password"
        passField.delegate = self
        passField.font = UIFont.systemFont(ofSize: 16)
        passField.isSecureTextEntry = true
        passField.backgroundColor = .white
        
        self.view.addSubview(self.passField)
    }
    
    func setupLoginButton() {
        loginButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 100, y: self.passField.frame.maxY + 30, width: 200, height: 50))
        
        loginButton.backgroundColor = .red
        loginButton.titleLabel?.textColor = .white
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = Colors.orangeAccent
        
        loginButton.addTarget(self, action: #selector(checkAuthorization), for: .touchUpInside)
        
        self.view.addSubview(self.loginButton)
    }
    
    func setupSignupButton() {
        signupButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 100, y: self.loginButton.frame.maxY + 10, width: 200, height: 50))
        
        signupButton.backgroundColor = .blue
        signupButton.titleLabel?.textColor = .white
        signupButton.setTitle("Create Account", for: .normal)
        signupButton.backgroundColor = Colors.orangeAccent
        
        signupButton.addTarget(self, action: #selector(checkAuthorization), for: .touchUpInside)
        
        self.view.addSubview(self.signupButton)
    }
}
