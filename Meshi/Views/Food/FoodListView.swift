//
//  FoodListView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

// add search functionality , sort and favourites and use computed property of appetizers 
// put them in coredata and fetch it
import SwiftUI

struct FoodListView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var selectedFoodViewModel = SelectedFoodViewModel()
    @State var searchedItem : String = ""
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                
                switch viewModel.status {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView("Fetching Menu")
                case .fetched:
                    
                    var computedProperty : [Appetizers] {
                        if searchedItem.isEmpty {
                            return viewModel.appetizers
                        }
                        else {
                            return viewModel.searchItem(searchedItem)
                        }
                    }
                    List(computedProperty) { appetizer in
                        
                        AppetizerList(appetizer: appetizer)
                            .onTapGesture {
                                
                                selectedFoodViewModel.isShowingSelectedFoodView = true
                                selectedFoodViewModel.appetizer = appetizer
                                
                            }
                    }
                    
                case .failed(let error):
                    Text(error.localizedDescription)
                        .alert(item: $viewModel.alertItem) {
                            alertItem in
                            
                            Alert(title: alertItem.title , message: alertItem.message , dismissButton: alertItem.dismissButton)
                        }
                    
                        .disabled(selectedFoodViewModel.isShowingSelectedFoodView)
                    
                }
                       
            }
                .navigationTitle("🍽️Meshi")
                .searchable(text: $searchedItem)
                
            }
            
                    .blur(radius: selectedFoodViewModel.isShowingSelectedFoodView ? 20 : 0)
                
                if selectedFoodViewModel.isShowingSelectedFoodView {
                    SelectedFoodView(appetizer:selectedFoodViewModel.appetizer!, isShowingSelectedFoodView:  $selectedFoodViewModel.isShowingSelectedFoodView)
                }
            
        }
    }
}

#Preview {
    FoodListView()
        .preferredColorScheme(.light)
        .environmentObject(Order())
}

// put a new view in the destination
//                    NavigationLink(destination: SelectedFoodView(appetizer: appetizer, isShowingSelectedFoodView: $isShowingSelectedFoodView)){
//
//}
//            .sheet(isPresented: $isShowingSelectedFoodView) { SelectedFoodView(appetizer: sampleAppetizer.sampleAppetizer, isShowingSelectedFoodView: $isShowingSelectedFoodView)
    
