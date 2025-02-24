//
//  Untitled.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 28/12/24.
//

import CoreData
import SwiftUI
class Services {
  
    static var viewContext : NSManagedObjectContext {
        PersistenceController.shared.persistentContainer.viewContext
    }
    static func save() throws {
        try viewContext.save()
    }
    static func populateOrderData (_ order : Order , viewContext : NSManagedObjectContext ) {
        for appetizer in order.orderItems {
            let orderItems = OrderData(context: viewContext)
            orderItems.name = appetizer.name
            orderItems.image = appetizer.imageURL
            orderItems.price = appetizer.price
            let convertedPrice = Int16(appetizer.price)
            orderItems.quantity = convertedPrice
            //orderItems.id = appetizer.id
        }
           
        do
        { try save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    static func populateOrderHistory (_ order : Order , viewContext : NSManagedObjectContext) {
        
        let orderHistory = OrderHistory(context: viewContext)
        orderHistory.orderId = UUID()
        orderHistory.totalPrize = order.totalPrize
        orderHistory.orderData = order
        
        do
        { try save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    static func deleteRecordsFromOrderDataEntity(context : NSManagedObjectContext )  {
        
        let request = OrderData.fetchRequest()
        
        request.sortDescriptors = []
        do {
            let orderDataToDelete = try viewContext.fetch(request)
            
            for records in orderDataToDelete {
                viewContext.delete(records)
            }
        }
        catch {
            print(error.localizedDescription)
        }
        do {
            try save()
        }
        
        catch {
            print(error.localizedDescription)
        }
    }
}
