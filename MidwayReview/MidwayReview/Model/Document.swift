//
//  Document.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation

class MyDocuments {
    static var sharedInstance: MyDocuments = MyDocuments()
    
    var documents: [Document]
    
    private init() {
        documents = []
    }
}

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
    
    func summary() -> String {
        return String(body.prefix(40))
    }
}
