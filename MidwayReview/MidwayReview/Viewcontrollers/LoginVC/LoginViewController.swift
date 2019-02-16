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
        setupTitleLabel()
        
        self.view.backgroundColor = Colors.primaryDark
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
                FirebaseUtils.login(email: email, password: password, completion: {
                    error in
                    
                    if error != nil {
                        DispatchQueue.main.async {
                            let alertView = UIAlertController(title: "Error", message: "Something went wrong while logging in. Please try again", preferredStyle: .alert)
                            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                })
            } else {
                FirebaseUtils.signup(email: email, password: password, completion: {
                    error in
                    
                    if error != nil {
                        DispatchQueue.main.async {
                            let alertView = UIAlertController(title: "Error", message: "Something went wrong while creating an account. Please try again", preferredStyle: .alert)
                            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                })
            }
        } else {
            let alertView = UIAlertController(title: "Error", message: "Please enter a valid email and password", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
