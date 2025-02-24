//
//  AccountViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 30/11/24.
//

import Foundation

final class AccountViewModel : ObservableObject {
    
    @Published  var firstName : String = ""
    @Published  var lastName : String = ""
    @Published  var email : String = ""
    @Published  var birthday = Date()
    @Published var cheese : Bool = false
    @Published var mayonnaise : Bool = false
    @Published var alert : AlertView?
    
    var isValidForm : Bool {
        if firstName.isEmpty && lastName.isEmpty && email.isEmpty {
            alert = alertMessage.InvalidForm
            return  false
        }
      
        guard email.isValidEmail else {
            alert = alertMessage.InvalidEmail
            return false
        }
        return true
    }
    
    func saveChanges () {
        guard isValidForm else {
            return
        }
        
        print("Changes have been saved")
    }
}
