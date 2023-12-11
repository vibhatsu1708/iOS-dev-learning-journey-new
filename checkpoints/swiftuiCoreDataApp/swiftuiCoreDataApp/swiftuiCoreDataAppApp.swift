//
//  swiftuiCoreDataAppApp.swift
//  swiftuiCoreDataApp
//
//  Created by Vedant Mistry on 22/11/23.
//

import SwiftUI

@main
struct swiftuiCoreDataAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
