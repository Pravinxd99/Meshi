//
//  CustomOperator.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 23/01/25.
//

import Foundation

public func == ( appetizer1 : Appetizers , appetizer2 : Appetizers) -> Bool {
    if appetizer1.name == appetizer2.name {
        return true
    }
    else  {
        return false
    }
}
