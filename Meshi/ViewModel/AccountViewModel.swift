//
//  AccountViewModel.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 30/11/24.
//

import Foundation
import SwiftUI


final class AccountViewModel : ObservableObject {
    
    @AppStorage("user") var userData :Data?
    @Published var user = User()
    @Published var alert : AlertView?
    
    var isValidForm : Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alert = alertMessage.InvalidForm
            return  false
        }
        guard user.email.isValidEmail else {
            alert = alertMessage.InvalidEmail
            return false
        }
        return true
    }
    
    func saveChanges () {
        guard isValidForm else {
            return 
        }
            do {
                
                let data =  try JSONEncoder().encode(user)
                userData = data
                alert = alertMessage.userSuccess
            }
            catch {
                return alert = alertMessage.userError
            }
            
        }
    func retriveUser () {
        guard let UserData = userData else {
            return
        }
        
        do {
            
            user =  try JSONDecoder().decode(User.self, from: UserData)
            
        }
        catch {
            return alert = alertMessage.userError
        }
        
    }
    }
    

