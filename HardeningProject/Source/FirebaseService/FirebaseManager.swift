//
//  FirebaseManager.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    
    static let shared = FirestoreManager()
    
    private func configure() -> Firestore {
        var database: Firestore?
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        guard let db = database else { return Firestore.firestore() }
        return db
    }
    
    private func saveData() {
        
    }
    
    private func getData() {
        
    }
}
