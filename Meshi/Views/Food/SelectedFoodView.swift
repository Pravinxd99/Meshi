//
//  SelectedFoodView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 28/11/24.
//

import SwiftUI

struct SelectedFoodView: View {
    @EnvironmentObject var order : Order
    var appetizer: Appetizers
    @Binding var isShowingSelectedFoodView: Bool
    var body: some View {
            VStack {
                AppetizerImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                VStack{
                    TitleView(title: appetizer.name)
                        .padding()
                    descriptionView(description: appetizer.description)
                    NutritionInfo(appetizer: appetizer)
                    .padding(.trailing)
                }
                Spacer()
                Button {
                    
                    order.add(appetizer)
                        
                    isShowingSelectedFoodView = false
                    
                    
                } label: {
                    Text(" $ \(String(appetizer.price)) - Add to order ")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 40)
            .overlay(XButton(isShowingSelectedFoodView: $isShowingSelectedFoodView) , alignment: .topTrailing)
            
        }
}

#Preview {
    SelectedFoodView(appetizer: sampleAppetizer.sampleAppetizer, isShowingSelectedFoodView: .constant(true) //isShowingSelectedFoodView: .constant(true)
        
    )
    .environmentObject(Order())
    .preferredColorScheme(.light)
}

struct TitleView : View {
    var title : String
    var body: some View {
        
        Text(title)
            .foregroundColor(.accentColor)
            .font(.title2)
    }
}

struct descriptionView : View {
    var description : String
    var body: some View {
        
        Text(description)
            .font(.title3)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.center)
            .font(.body)
            .foregroundColor(.accentColor)
            .padding()
    }
}

