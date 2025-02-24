//
//  OrderData+CoreDataProperties.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 18/01/25.
//

import Foundation
import CoreData
extension OrderData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderData> {
        return NSFetchRequest<OrderData>(entityName: "OrderData")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var orderhistory: NSSet

}

// MARK: Generated accessors for orderhistory
extension OrderData {

    @objc(addOrderhistoryObject:)
    @NSManaged public func addToOrderhistory(_ value: OrderHistory)

    @objc(removeOrderhistoryObject:)
    @NSManaged public func removeFromOrderhistory(_ value: OrderHistory)

    @objc(addOrderhistory:)
    @NSManaged public func addToOrderhistory(_ values: NSSet)

    @objc(removeOrderhistory:)
    @NSManaged public func removeFromOrderhistory(_ values: NSSet)

}

extension OrderData : Identifiable {

}


/*order is a array of items which currently has [bun , butter , jam]
orderData table will be populated with this array of appetizer objects ie [bun , butter , jam]
orderhistory table has a orderitems attribute which is of type Order which is again array of items which currently has [bun , butter , jam]
at the same time orderhistory table is also populated with a order id , total prize and an order of a transformable type which internally has [bun , butter , jam] .
so even i delete the orderdata table here i can still display the orderitems such as [bun , butter , jam] using the orderid
am */
