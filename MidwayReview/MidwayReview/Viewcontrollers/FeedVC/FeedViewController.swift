//
//  FirstViewController.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpTableView()
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

