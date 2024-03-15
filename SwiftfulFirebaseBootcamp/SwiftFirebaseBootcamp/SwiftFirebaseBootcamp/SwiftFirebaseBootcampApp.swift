//
//  SwiftFirebaseBootcampApp.swift
//  SwiftFirebaseBootcamp
//
//  Created by Vedant Mistry on 16/03/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Firebase app configured")

    return true
  }
}

@main
struct SwiftFirebaseBootcampApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
