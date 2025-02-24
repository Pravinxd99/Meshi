//
//  OrderSummary.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 08/12/24.
//
// create a fetchrequest and show its results 
import SwiftUI

struct OrderSummary: View {
    
    @FetchRequest(sortDescriptors: []) var results : FetchedResults<OrderHistory>
    var body: some View {
        List(results) { items in
            ForEach(items.orderData.orderItems, id: \.self) { orderItem in
                                Text(String(orderItem))
                            }
            
        }
    }
}

#Preview {
    OrderSummary()
}
