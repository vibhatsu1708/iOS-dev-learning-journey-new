//
//  coreDataAppApp.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 11/12/23.
//

import SwiftUI

@main
struct coreDataAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.dataContainer.viewContext)
        }
    }
}
