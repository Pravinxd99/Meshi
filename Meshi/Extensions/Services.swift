//
//  Untitled.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 28/12/24.
//

import CoreData
class Services {
  
    static var viewContext : NSManagedObjectContext {
        PersistenceController.shared.persistentContainer.viewContext
    }
    
    
    static func save() throws {
        try viewContext.save()
    }
    static func populateOrderData (_ order : Order ) {
        for appetizer in order.orderItems {
            let orderItems = OrderData(context: viewContext)
            orderItems.name = appetizer.name
            orderItems.image = appetizer.imageURL
            orderItems.price = appetizer.price
            let convertedPrice = Int16(appetizer.price)
            orderItems.quantity = convertedPrice
        }
           
        do
        { try save()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    static func
}
