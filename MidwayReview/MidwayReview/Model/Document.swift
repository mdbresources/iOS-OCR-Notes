//
//  Document.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation

class Document {
    var id: String
    var title: String
    var body: String
    var timestamp: Date
    
    init(withTitle title:String, body: String, createdOn timestamp: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
    init(withId id:String, titled title:String, body:String, createdOn timestamp: Date) {
        self.id = id
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
    func update(title: String, body: String) {
        self.title = title
        self.body = body
        
        FirebaseUtils.updateDocument(self, completion: nil)
    }
    
    func summary() -> String {
        return String(body.prefix(100))
    }
    
    func toDict() -> [AnyHashable: Any] {
        return ["id":id, "title":title, "body":body, "timestamp":timestamp.timeIntervalSince1970]
    }
}
