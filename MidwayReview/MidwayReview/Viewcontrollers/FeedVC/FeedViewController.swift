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
        loadDocs()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    private func setUpTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(DocumentTableViewCell.self, forCellReuseIdentifier: "DocumentCell")
        
        self.view.addSubview(self.tableView)
    }
}

