//
//  OrderHistory+CoreDataProperties.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 18/01/25.
//

import Foundation
import Foundation
import CoreData


extension OrderHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderHistory> {
        return NSFetchRequest<OrderHistory>(entityName: "OrderHistory")
    }

    @NSManaged public var orderData: Order
    @NSManaged public var orderId: UUID?
    @NSManaged public var totalPrize: Double
    @NSManaged public var orders: OrderData?

}

extension OrderHistory : Identifiable {

}
