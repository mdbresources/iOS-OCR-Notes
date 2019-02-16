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
    var uuid: String?
    
    private init() {
        documents = []
        
        if let storedId = UserDefaults.standard.string(forKey: "uid") {
            uuid = storedId
        }
    }
    
    func addDocument(_ doc: Document, completion: (() -> Void)?) {
        // TODO
    }
}
