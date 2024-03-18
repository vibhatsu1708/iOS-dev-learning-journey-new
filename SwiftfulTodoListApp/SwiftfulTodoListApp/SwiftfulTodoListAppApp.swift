//
//  SwiftfulTodoListAppApp.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

@main
struct SwiftfulTodoListAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListsView()
            }
        }
    }
}
