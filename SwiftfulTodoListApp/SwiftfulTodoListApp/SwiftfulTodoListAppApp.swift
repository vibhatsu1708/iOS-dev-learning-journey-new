//
//  SwiftfulTodoListAppApp.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

@main
struct SwiftfulTodoListAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListsView()
            }
            .environmentObject(listViewModel)
        }
    }
}
