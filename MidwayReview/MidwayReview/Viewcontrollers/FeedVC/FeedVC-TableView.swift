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
        return DocumentManager.sharedInstance.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath) as! DocumentTableViewCell
        
        let doc = DocumentManager.sharedInstance.documents[indexPath.row]
        
        cell.titleLabel?.text = doc.title
        cell.descriptionLabel?.text = doc.summary()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        cell.dateLabel?.text = formatter.string(from: doc.timestamp)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDoc = DocumentManager.sharedInstance.documents[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DocumentViewController {
            vc.document = self.selectedDoc
        }
    }
}
