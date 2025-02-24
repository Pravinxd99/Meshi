//
//  Persistance.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 08/12/24.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let persistentContainer : NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "OrderContainer")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error initailaizing OrdersModel , \(error)")
            }
        }
    }
    
    func peristenceStoreURL () -> URL? {
        guard let storeURL = persistentContainer.persistentStoreDescriptions.first?.url else {
            return nil
        }
        return storeURL
    }
        
    
}
