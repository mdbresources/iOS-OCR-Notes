//
//  FeedVC-TableView.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyDocuments.sharedInstance.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath) as! DocumentTableViewCell
        
        let doc = MyDocuments.sharedInstance.documents[indexPath.row]
        
        cell.titleLabel?.text = doc.title
        cell.descriptionLabel?.text = doc.summary()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
