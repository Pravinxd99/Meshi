//
//  Transformer.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 17/01/25.
//

import Foundation

public class Transformer : ValueTransformer {
    public override func transformedValue(_ value: Any?) -> Any? {
        guard let orderData = value as? Order else {
            return nil
        }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: orderData, requiringSecureCoding: true)
            return data
        }
        catch {
            return nil
        }
    }
    
    public override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            return nil
        }
        do {
            let order = try NSKeyedUnarchiver.unarchivedObject(ofClass: Order.self, from: data)
            return order
        }
        catch {
            return nil
        }
    }
}
