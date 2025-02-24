//
//  SelectedFoodViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 28/11/24.
//

import Foundation
import SwiftUI

final class SelectedFoodViewModel : ObservableObject {
        @Published var appetizer : Appetizers? {
                didSet {
            isShowingSelectedFoodView = true
        }
    }
    @Published var isShowingSelectedFoodView : Bool = false
}
