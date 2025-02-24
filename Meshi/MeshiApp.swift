//
//  MeshiApp.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 26/10/24.
//

import SwiftUI

@main
struct MeshiApp: App {
    @StateObject var order = Order()
    // try this without using statebject
    let persistenceController = PersistenceController.shared
    init() {
        ValueTransformer.setValueTransformer(Transformer(), forName: NSValueTransformerName("Transformer"))
    }
    var body: some Scene {
        WindowGroup {
            MeshiTabView()
                .environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.persistentContainer.viewContext)
                .onAppear(){
                    if let sqlitePath = persistenceController.peristenceStoreURL() {
                        print(sqlitePath)
                    }
                }
        }
    }
}
