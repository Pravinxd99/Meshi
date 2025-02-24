//
//  FetchController.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import UIKit

struct FetchController {
    
    private let cache = NSCache<NSString,UIImage>()
    private enum fetchError : Error {
        
        case badResponse
        case badData
    }
    
    private let baseURL = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/")!
    
    func fetchAppetizers () async throws -> [Appetizers] {
        
        //var fetchComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let fetchURL = baseURL.appending(path: "appetizers")
        
        let (data,response ) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse ,  response.statusCode == 200 else {
            
            throw fetchError.badResponse
            
        }
        
        guard let foodDictionary = try JSONSerialization.jsonObject(with: data) as? [String : Any] , let foods = foodDictionary["request"] as? [[String : Any ]] else {
            throw fetchError.badData
        }
        
        var appetizers : [Appetizers] = []
        
        for food in foods {
            
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: food, options: [])
                
                
                let appetizer = try  JSONDecoder().decode(Appetizers.self , from : jsonData)
                
                let appetizersWithQuantity =
                Appetizers(
                    name: appetizer.name ,
                    description: appetizer.description,
                    carbs: appetizer.carbs,
                    imageURL: appetizer.imageURL,
                    price: appetizer.price,
                    id: appetizer.id,
                    calories: appetizer.calories,
                    protein: appetizer.protein
                   /* quantity: 1*/ // Default quantity
                   
                )
               
                // shouldn't straightaway decode array of objects , append to an array one by one after decoding
                appetizers.append(appetizersWithQuantity)
            }
            
            catch {
                print(error.localizedDescription)
                
            }
        }
        return appetizers
    }

        func downloadImageInController ( fromURLString : String ) async throws -> UIImage? {
            
            let cacheKey = NSString(string: fromURLString)
            
            if let cachedImgae = cache.object(forKey: cacheKey) {
                return cachedImgae
            }
            
            let (data , response ) = try await URLSession.shared.data(from:URL(string :fromURLString)!)
            
            guard let response = response as? HTTPURLResponse ,  response.statusCode == 200 else {
                
                throw fetchError.badResponse
                
            }
            // if let url , let data = Data (contentsof : url) , let uiImage = UIimage(data : imageData)
            
            guard  let image = UIImage(data: data) else {
                
                throw URLError(.cannotDecodeContentData)
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            return image
        }
        
    }

/*let name : String
    let description : String
    let carbs : Int
    let imageURL : String
    let price : Double
    let id : Int
    let calories : Int
    let protein : Int
    var quantity : Int = 1
    */
