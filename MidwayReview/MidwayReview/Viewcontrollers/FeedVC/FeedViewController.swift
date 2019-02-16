//
//  FirstViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FeedViewController: UIViewController {
    private var tableView: UITableView!
    var selectedDoc: Document!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpTableView()
        self.setUpNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let _ = DocumentManager.sharedInstance.uuid {
            if DocumentManager.sharedInstance.documents.count == 0 {
                loadDocs()
            } else {
                self.tableView.reloadData()
            }
        } else {
            self.performSegue(withIdentifier: "toLogin", sender: self)
        }
    }
    
    func loadDocs() {
        FirebaseUtils.loadAllDocuments { (documents) in
            guard let documents = documents else { return }
            for doc in documents {
                DocumentManager.sharedInstance.documents.append(doc)
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func signout() {
        UserDefaults.standard.set(nil, forKey: "uid")
        FirebaseUtils.logout()
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    private func setUpNavBar() {
        self.navigationItem.setLeftBarButton(UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signout)), animated: true)
        self.navigationItem.title = "Notes"
    }
    
    private func setUpTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(DocumentTableViewCell.self, forCellReuseIdentifier: "DocumentCell")
        
        self.view.addSubview(self.tableView)
    }
}

