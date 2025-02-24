//
//  ViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import Foundation

@MainActor
class ViewModel : ObservableObject{
    
    enum Status {
        
        case notStarted
        case fetching
        case fetched
        case failed (error : Error)
    }
   
    @Published private(set)var status : Status = .notStarted
    private let fetcher = FetchController()
    @Published var sampleAppetizer : Appetizers?
    @Published var alertItem : AlertView?
    @Published var appetizers : [Appetizers] = []
    @Published var appetizersCopy : [Appetizers] = []
    
    init() {
        loadData()
        
        Task {
            await getData()
        }
    }
    
    func loadData ()  {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let  appetizersData = try! Data(contentsOf: Bundle.main.url(forResource: "sampleAppetizer", withExtension: "json")!)
        
        sampleAppetizer = try? decoder.decode(Appetizers.self, from: appetizersData)
        
    }
  func getData() async {
        
        status = .fetching
        do {
            appetizers = try await fetcher.fetchAppetizers()
            appetizersCopy = appetizers
            status = .fetched
            print("Status changed to fetched.")
            
            
        }
        
        catch {
            
            status = .failed(error: error)
            alertItem =  alertMessage.InvalidData
            
           
        }
    }
    
    func searchItem ( _ searchedItem : String)-> [Appetizers] {
        
        if searchedItem.isEmpty {
            return appetizers
        }
        else {
            appetizers =  appetizersCopy.filter { appetizer in
                appetizer.name.lowercased().localizedStandardContains(searchedItem)
            }
        }
        print(appetizersCopy)
            return appetizersCopy
        }
    }

