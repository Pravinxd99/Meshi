//
//  ViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import Foundation


struct Appetizers : Decodable {
    
    let name : String
    let description : String
    let carbs : Int
    let imageURL : URL
    let price : Int
    let id : Int
    let calories : Int
    let protein : Int
}
