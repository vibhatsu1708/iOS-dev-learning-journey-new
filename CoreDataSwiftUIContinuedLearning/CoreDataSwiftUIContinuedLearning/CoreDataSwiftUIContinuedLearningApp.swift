//
//  CoreDataSwiftUIContinuedLearningApp.swift
//  CoreDataSwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 25/03/24.
//

import SwiftUI

@main
struct CoreDataSwiftUIContinuedLearningApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
