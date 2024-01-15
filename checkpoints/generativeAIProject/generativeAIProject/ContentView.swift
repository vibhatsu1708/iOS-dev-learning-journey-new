//
//  ContentView.swift
//  generativeAIProject
//
//  Created by Vedant Mistry on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
            .tabItem {
                Label("Gemini", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
