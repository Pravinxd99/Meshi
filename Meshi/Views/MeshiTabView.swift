//
//  ContentView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import SwiftUI

struct MeshiTabView: View {
    var body: some View {
        
        TabView{
            
            FoodListView()
            .tabItem{
                
                Label("Home", systemImage: "house")
            }
            
            OrderView()
            .tabItem{
                
                Label("Order", systemImage: "fork.knife.circle.fill")
            }
            AccountView()
                .tabItem{
                
                Label("Account", systemImage: "person.crop.circle.fill")
            }
            
        }
        .accentColor(Color(.brandPrimary))
    }
}

#Preview {
    MeshiTabView()
        .preferredColorScheme(.light)
}
