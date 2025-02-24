//
//  ImageLoader.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 15/11/24.
//


import SwiftUI
@MainActor
final class ImageLoader : ObservableObject {
    
    var controller = FetchController()
    
    @Published var image : Image? = nil
    
    func downloadImage (fromURLString : String) async   {
        
       let uiImage =  try! await controller.downloadImageInController(fromURLString: fromURLString)
            
            guard let uiImage = uiImage else { return }
           
                self.image = Image(uiImage: uiImage)
     
    }
}


struct RemoteImage : View {
    var image : Image?
    var body: some View {
        
        image?.resizable() ?? Image("food-placeholder").resizable()
        
    }
}

struct AppetizerImage : View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    var body: some View {
        
        RemoteImage(image: imageLoader.image)
            .onAppear{
                Task {
                    await imageLoader.downloadImage(fromURLString: urlString)
                    
                }
            }
    }
} 
