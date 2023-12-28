//
//  CoreMLAppApp.swift
//  CoreMLApp
//
//  Created by Vedant Mistry on 25/12/23.
//

import SwiftUI

@main
struct CoreMLAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DetectedObject())
        }
    }
}
