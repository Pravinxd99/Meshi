//
//  AlertView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 06/11/24.
//

import Foundation
import SwiftUI

struct AlertView : Identifiable {
    
    let id = UUID()
    let message : Text
    let title : Text
    let dismissButton : Alert.Button
}

struct alertMessage {
    
    static let InvalidResponse = AlertView(message: Text("Invalid Response"), title: Text("Error"), dismissButton: .default(Text("OK")))
    static let InvalidData = AlertView(message: Text("Invalid Data"), title: Text("Error"), dismissButton: .default(Text("OK")))
    static let InvalidEmail = AlertView(message: Text("InvalidEmail"), title: Text("Error"), dismissButton: .default(Text("OK")))
    static let InvalidForm = AlertView(message: Text("Please ensure all the field are properly filled"), title: Text("Error"), dismissButton: .default(Text("OK")))
    
    
}
