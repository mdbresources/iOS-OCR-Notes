//
//  DocumentManager.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation

class DocumentManager {
    static var sharedInstance: DocumentManager = DocumentManager()
    
    var documents: [Document]
    
    private init() {
        documents = []
    }
    
    func addDocument(_ doc: Document, completion: (() -> Void)?) {
        FirebaseUtils.addDocument(doc, completion: {
            self.documents.append(doc)
            
            completion?()
        })
    }
}
