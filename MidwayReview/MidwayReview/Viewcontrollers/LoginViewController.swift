//
//  LoginViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    var emailField: UITextField!
    var passField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupEmailField()
        setupPassField()
        setupLoginButton()
        setupSignupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                DocumentManager.sharedInstance.uuid = user.uid
                UserDefaults.standard.set(user.uid, forKey: "uid")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @objc func checkAuthorization(sender: UIButton) {
        if let email = emailField.text, let password = passField.text, password != "", email.contains("@") {
            if sender == loginButton {
                FirebaseUtils.login(email: email, password: password)
            } else {
                FirebaseUtils.signup(email: email, password: password)
            }
        } else {
            let alertView = UIAlertController(title: "Error", message: "Please enter a valid email and password", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    private func setupEmailField() {
        emailField = UITextField(frame: CGRect(x: 20, y: self.view.frame.height / 2 - 50, width: self.view.frame.width - 40, height: 30))
        
        emailField.placeholder = "Email"
        emailField.delegate = self
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.keyboardType = .emailAddress
        
        self.view.addSubview(self.emailField)
    }
    
    private func setupPassField() {
        passField = UITextField(frame: CGRect(x: 20, y: self.emailField.frame.maxY + 10, width: self.view.frame.width - 40, height: 30))
        
        passField.placeholder = "Password"
        passField.delegate = self
        passField.font = UIFont.systemFont(ofSize: 16)
        passField.isSecureTextEntry = true
        
        self.view.addSubview(self.passField)
    }
    
    private func setupLoginButton() {
        loginButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 100, y: self.passField.frame.maxY + 30, width: 200, height: 50))
        
        loginButton.backgroundColor = .red
        loginButton.titleLabel?.textColor = .white
        loginButton.setTitle("Login", for: .normal)
        
        loginButton.addTarget(self, action: #selector(checkAuthorization), for: .touchUpInside)
        
        self.view.addSubview(self.loginButton)
    }
    
    private func setupSignupButton() {
        signupButton = UIButton(frame: CGRect(x: self.view.frame.width / 2 - 100, y: self.loginButton.frame.maxY + 10, width: 200, height: 50))
        
        signupButton.backgroundColor = .blue
        signupButton.titleLabel?.textColor = .white
        signupButton.setTitle("Create Account", for: .normal)
        
        signupButton.addTarget(self, action: #selector(checkAuthorization), for: .touchUpInside)
        
        self.view.addSubview(self.signupButton)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
