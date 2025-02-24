//
//  EmptyState.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 08/12/24.
//

import SwiftUI

struct EmptyState: View {
    var message : String = "Default Message"
    var image : String = "empty-order"
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
            
            EmptyOrderView(message: message, image: image )
        }
    }
}

#Preview {
    EmptyState()
}



struct EmptyOrderView: View {
    
    var message : String
    var image : String
    var body: some View {
        VStack (alignment: .center){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text(message)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            
        }
        
  
    }
}
