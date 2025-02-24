
//
//  AlertView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 06/11/24.


import SwiftUI

public class Order: NSObject, ObservableObject, NSCoding {
    
    override init() {
            super.init()
        }
        
    
    static var supportsSecureCoding : Bool {
        return true
    }
    @Published private(set) var orderItems: [Appetizers] = []
    @Published var alert: AlertView?
    
    enum Status {
        case notStarted
        case populatedOrderTable
        case populatedHistoryTable
        case deletingOrderDataTable
    }
    
    @Published private(set) var status = Status.notStarted
    public func encode(with coder: NSCoder) {
        coder.encode(orderItems.count, forKey: "orderItemsCount")
        for appetizer in orderItems {
            coder.encode(appetizer.name, forKey: "name")
            coder.encode(appetizer.description, forKey: "description")
            coder.encode(appetizer.carbs, forKey: "carbs")
            coder.encode(appetizer.imageURL, forKey: "imageURL")
            coder.encode(appetizer.price, forKey: "price")
            coder.encode(appetizer.id, forKey: "id")
            coder.encode(appetizer.calories, forKey: "calories")
            coder.encode(appetizer.protein, forKey: "protein")
            coder.encode(appetizer.quantity, forKey: "quantity")
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init()
        
        let count = aDecoder.decodeInteger(forKey: "orderItemsCount")
        var decodedItems: [Appetizers] = []

        for _ in 0..<count {
            let name = aDecoder.decodeObject(forKey: "name") as? String ?? "default name"
            let description = aDecoder.decodeObject(forKey: "description") as? String ?? "default description"
            let carbs = aDecoder.decodeInteger(forKey: "carbs")
            let imageURL = aDecoder.decodeObject(forKey: "imageURL") as? String ?? "default image URL"
            let price = aDecoder.decodeDouble(forKey: "price")
            let id = aDecoder.decodeInteger(forKey: "id")
            let calories = aDecoder.decodeInteger(forKey: "calories")
            let protein = aDecoder.decodeInteger(forKey: "protein")
            let quantity = aDecoder.decodeInteger(forKey: "quantity")

            let appetizer = Appetizers(name: name, description: description, carbs: carbs, imageURL: imageURL, price: price, id: id, calories: calories, protein: protein, quantity: quantity)
            decodedItems.append(appetizer)
        }
        
        self.orderItems = decodedItems
    }
    var totalPrize: Double {
        orderItems.reduce(0) { $0 + $1.price }
    }

    func add(_ addedAppetizer: Appetizers) {
        if orderItems.contains(where: { $0.id == addedAppetizer.id }) {
            alert = alertMessage.alreadyAdded
            return
        } else {
            orderItems.append(addedAppetizer)
        }
    }

    func deleter(_ appetizer: IndexSet) {
        orderItems.remove(atOffsets: appetizer)
    }
}
