//
//  NutritionInfo.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 30/11/24.
//

import SwiftUI

struct NutritionInfo: View {
    
    var appetizer : Appetizers
    var body: some View {
        HStack(spacing: 20) {
            
            VStack {
                Text("Calories")
                    .multilineTextAlignment(.leading)
                Text(String(appetizer.calories))
                    .foregroundColor(.accentColor)
                
            }
            .padding(.leading , 25)
            
            VStack {
                Text("Carbs")
                Text(String(appetizer.carbs))
                    .foregroundColor(.accentColor)
            }
            
            .padding(15)
            VStack {
                Text("Protein")
                Text(String(appetizer.protein))
                    .foregroundColor(.accentColor)
                
                
            }
            .padding(.trailing)
        }
        .italic(true)
    }
}

#Preview {
    NutritionInfo(appetizer: sampleAppetizer.sampleAppetizer)
}
