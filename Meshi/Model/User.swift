//
//  User.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 30/11/24.
//

import Foundation
import SwiftUI

struct User : Codable {
    
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var birthday = Date()
    var cheese : Bool = false
    var mayonnaise : Bool = false
   
}
