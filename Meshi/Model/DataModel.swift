//
//  ViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import Foundation

struct Appetizers : Decodable , Identifiable{
    
    let name : String
    let description : String
    let carbs : Int
    let imageURL : String
    let price : Double
    let id : Int
    let calories : Int
    let protein : Int
   
}

struct sampleAppetizer {
    
    
    static let sampleAppetizer = Appetizers(name: "sample", description: "sample", carbs: 1, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 2.2, id: 3, calories: 4, protein: 5)
}
