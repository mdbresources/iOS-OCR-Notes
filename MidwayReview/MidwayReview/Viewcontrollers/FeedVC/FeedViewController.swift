//
//  FirstViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    // TODO
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpTableView()
        self.setUpNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // TODO
        
    }
    
    func loadDocs() {
        // TODO
    }
    
    @objc func signout() {
        // TODO
    }
    
    private func setUpNavBar() {
        self.navigationController?.navigationBar.tintColor = Colors.orangeAccent
        self.navigationController?.navigationBar.barTintColor = Colors.primaryDark
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:Colors.orangeAccent]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        // TODO Add Signout button to the navbar and set its title
    }
    
    private func setUpTableView() {
        // TODO
    }
}

