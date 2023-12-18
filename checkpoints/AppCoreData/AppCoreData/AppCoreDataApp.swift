//
//  AppCoreDataApp.swift
//  AppCoreData
//
//  Created by Vedant Mistry on 17/12/23.
//

import SwiftUI

@main
struct AppCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
