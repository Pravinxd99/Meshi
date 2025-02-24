//
//  OrderView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import SwiftUI

struct OrderView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var orderResult : FetchedResults<OrderData>
  
    @EnvironmentObject var order : Order
    var body: some View {
        
        ZStack {
        NavigationView {
            VStack {
                List {
                    
                    ForEach(order.orderItems) { orderitem in
                        AppetizerListForCartView( appetizer: orderitem)
                    }
                    .onDelete(perform: order.deleter)
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button {
                    // update the state 
                    switch order.status {
                    case .notStarted :
                        print("Haven't started populating yet")
                        fallthrough
                    case .populatedHistoryTable :
                        Services.populateOrderData(order , viewContext: viewContext )
                        print("populatedHistoryTable")
                        fallthrough
                    case .populatedOrderTable:
                        Services.populateOrderHistory(order , viewContext: viewContext)
                        print("populatedOrderTable")
                        fallthrough
                    case .deletingOrderDataTable :
                        Services.deleteRecordsFromOrderDataEntity(context:viewContext )
                        print("deletingOrderDataTable")
                        
                        // after deleting the entries make the order variable empty 
                    }
                    
                } label: {
                    Text(String(order.totalPrize))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 40)
                        .background(Color.button)
                        .cornerRadius(10)
                        .padding()
                }
                
            }
            .navigationTitle("🛍️ Orders")
            
        }
            if order.orderItems.isEmpty {
                EmptyState(message: "You don't have any items in your order bucket at the moment, \n try adding add some " , image: "empty-order")
            }
    }
       
    }
    
}
#Preview {
    OrderView()
        .environmentObject(Order())
        .environment(\.managedObjectContext , PersistenceController.shared.persistentContainer.viewContext)
}


