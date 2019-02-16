//
//  FirebaseUtils.swift
//  MidwayReview
//
//  Created by Anmol Parande on 2/15/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import Foundation

class FirebaseUtils {
    static func logout() {
        // TODO
        
    }
    
    static func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        // TODO
    }
    
    static func signup(email:String, password:String, completion: @escaping (Error?) -> Void) {
        // TODO
    }
    
    static func loadAllDocuments(completion: @escaping ([Document]?) -> Void) {
        // TODO
    }
    
    static func addDocument(_ doc: Document, completion: @escaping (()  -> Void)) {
        // TODO
    }
    
    static func updateDocument(_ doc: Document, completion: (()  -> Void)?) {
        // TODO
    }
}
