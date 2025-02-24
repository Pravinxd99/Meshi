//
//  ViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import Foundation
import SwiftUI
import CoreData

public struct Appetizers : Identifiable , Codable , Equatable , Hashable, LosslessStringConvertible {
    public init?(_ description: String) {
        return nil
    }
    
    
    public var name : String
    public var description : String
    public var carbs : Int
    public var imageURL : String
    public var price : Double
    public var id : Int
    public var calories : Int
    public var protein : Int
    public var quantity: Int?

    
    init(name: String, description: String, carbs: Int, imageURL: String, price: Double, id: Int, calories: Int, protein: Int , quantity : Int = 1) {
        self.name = name
        self.description = description
        self.carbs = carbs
        self.imageURL = imageURL
        self.price = price
        self.id = id
        self.calories = calories
        self.protein = protein
        self.quantity = quantity
        
       
    }
    
//    mutating func modifyQuantity ( quantity : Int)  {
//        self.quantity = quantity
//    }
   
}

struct sampleAppetizer  {
   
    
    static let sampleAppetizer = Appetizers(name:"Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth, try this you'll get addicted .", carbs: 60, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 2.2, id: 0, calories: 400, protein: 54)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderitem1 = Appetizers(name:"Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth, try this you'll get addicted .", carbs: 60, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 2.2, id: 0, calories: 400, protein: 54)
    
    static let orderitem2 = Appetizers(name:"Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth, try this you'll get addicted .", carbs: 60, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 2.2, id: 0, calories: 400, protein: 54)
    
    static let orderitem3 = Appetizers(name:"Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth, try this you'll get addicted .", carbs: 60, imageURL:  "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 2.2, id: 0, calories: 400, protein: 54)
    
    
    static let orderItemsBasket = [orderitem1 , orderitem2 , orderitem3]
    
}
/*
{
      "protein": 14,
      "description": "This perfectly thin cut just melts in your mouth.",
      "carbs": 0,
      "id": 1,
      "price": 8.99,
      "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
      "calories": 300,
      "name": "Asian Flank Steak"
    }
*/

/*
 i'm planning to create a order model like this
 Struct Appetizer {
 var name : String
 var price : Float
 var image : URL
 }
 Struct Order {
 var orderItems : [Appetizers]
 }*/
