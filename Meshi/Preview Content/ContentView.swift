//
//  ContentView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            
            FoodListView()
            .tabItem{
                
                Label("Home", systemImage: "house")
            }
            AccountView()
            tabItem{
                
                Label("Account", systemImage: "person.crop.circle.fill")
            }
            OrderView()
            .tabItem{
                
                Label("Order", systemImage: "fork.knife.circle.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
