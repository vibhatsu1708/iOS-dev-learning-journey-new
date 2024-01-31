//
//  FirebaseProjectApp.swift
//  FirebaseProject
//
//  Created by Vedant Mistry on 17/01/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
