//
//  SelectedAppetizerView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 05/11/24.
//

import SwiftUI

struct AppetizerList: View {
    var appetizer : Appetizers
    var body: some View {
        HStack {
            AppetizerImage(urlString: appetizer.imageURL)
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                Text(String(format: " $ %.2f", appetizer.price))
            }
        }
    }
}

#Preview {
    AppetizerList(appetizer: sampleAppetizer.sampleAppetizer )
}
