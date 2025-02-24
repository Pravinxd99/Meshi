//
//  AppetizerListForCartView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 27/12/24.
//

import SwiftUI

struct AppetizerListForCartView: View {
   
    @State var appetizer : Appetizers
    var body: some View {
        HStack {
            AppetizerImage(urlString: appetizer.imageURL)
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                Text(String(format: " $ %.2f", appetizer.price))
            }
            .padding()
            .padding(.trailing)
                Button ("-"){
                    if appetizer.quantity! <= 1 {
                       //
                            
                    }
                    
                }
                .disabled(true)
            Text(String(appetizer.quantity!))
                .font(.title3)
                .fontWeight(.bold)
                Button ("+"){
                    print(appetizer.quantity!)
//                    appetizer.modifyQuantity(quantity:appetizer.quantity! + 1)
//                   
                    
                }
                .padding(.trailing)
            
        }
    }
}

#Preview {
    AppetizerListForCartView(appetizer: (sampleAppetizer.sampleAppetizer))
}
