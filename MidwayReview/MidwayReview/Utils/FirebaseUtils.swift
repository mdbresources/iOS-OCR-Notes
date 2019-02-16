//
//  FirebaseUtils.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseUtils {
    static func loadAllDocuments(completion: @escaping ([Document]?) -> Void) {
        let dbRef = Database.database().reference()
        dbRef.child("Documents").observeSingleEvent(of: .value, with: { (snapshot) in
            var documents:[Document] = []
            
            for child in snapshot.children {
                let docDict = (child as! DataSnapshot).value as! NSDictionary
                
                let id = docDict.value(forKey: "id") as! String
                let title = docDict.value(forKey: "title") as! String
                let body = docDict.value(forKey: "body") as! String
                let timestamp = docDict.value(forKey: "timestamp") as! Double
                
                let document = Document(withId: id, titled: title, body: body, createdOn: Date(timeIntervalSince1970: timestamp))
                
                documents.append(document)
            }
            completion(documents)
        }) { (error) in
            print(error.localizedDescription)
            completion(nil)
        }
    }
    
    static func addDocument(_ doc: Document, completion: @escaping (()  -> Void)) {
        let dbRef = Database.database().reference()
        let newChild = dbRef.child("Documents").childByAutoId()
        doc.id = newChild.key!
        
        newChild.updateChildValues(doc.toDict()) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            completion()
        }
    }
    
    static func updateDocument(_ doc: Document, completion: (()  -> Void)?) {
        let dbRef = Database.database().reference()
        dbRef.child("Documents").child(doc.id).updateChildValues(doc.toDict()) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Updated \(doc.id)")
            }
            
            completion?()
        }
    }
}
