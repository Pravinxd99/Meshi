//
//  OrderModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 08/12/24.
//

import SwiftUI

final class Order : ObservableObject {
    
    @Published var orderItems : [Appetizers] = []
}
