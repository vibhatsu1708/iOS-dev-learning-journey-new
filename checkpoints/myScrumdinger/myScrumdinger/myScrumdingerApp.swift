//
//  myScrumdingerApp.swift
//  myScrumdinger
//
//  Created by Vedant Mistry on 25/10/23.
//

import SwiftUI

@main
struct myScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
