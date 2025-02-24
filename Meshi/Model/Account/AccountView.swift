//
//  AccountView.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    var alert :AlertView?
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: Text("Personal Info")) {
                    
                    TextField("FirstName", text: $viewModel.user.firstName)
                    TextField("LastName", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    DatePicker("Birthday", selection: $viewModel.user.birthday , displayedComponents: DatePickerComponents.date)
                        
                   
                    Button("Save Changes"){
                        
                        viewModel.saveChanges()
                    }
                }
               
                    Section(header: Text("Requests")) {
                        Toggle(isOn: $viewModel.user.cheese, label: {
                            Text("Extra Cheese")
                        })
                        
                        Toggle(isOn: $viewModel.user.mayonnaise, label: {
                            Text("Extra Mayonnaise")
                        })
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color(.button) ))
                
            }
            
                .navigationTitle("💁‍♂️ Account")
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alert) { alertitem in
            Alert(title: alertitem.title , message: alertitem.message , dismissButton: alertitem.dismissButton)
            
        }
    }
}

#Preview {
    AccountView()
}
