//
//  FoodListView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

// put them in coredata and fetch it 
import SwiftUI

struct FoodListView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        switch viewModel.status {
        case .notStarted:
            EmptyView()
        case .fetching:
            ProgressView("Fetching Meshi")
        case .fetched:
            
            NavigationStack{
                List(viewModel.appetizers) { appetizer in
                    
                    NavigationLink(destination: SelectedAppetizerView(appetizer: appetizer)){
                        
                        SelectedAppetizerView(appetizer: appetizer)
                    }
                    
                }
                .navigationTitle("Meshi")
            }
        case .failed(let error):
            Text(error.localizedDescription)
                .alert(item: $viewModel.alertItem) {
                    alertItem in
                    
                    Alert(title: alertItem.title , message: alertItem.message , dismissButton: alertItem.dismissButton)
                }
        }
            
       
    }
}

#Preview {
    FoodListView()
}

//.navigationDestination(for: Appetizers.self, destination: SelectedAppetizerView(appetizer: appetizer))
