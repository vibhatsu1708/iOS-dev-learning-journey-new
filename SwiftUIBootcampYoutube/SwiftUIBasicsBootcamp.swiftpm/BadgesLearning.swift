//
//  BadgesLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 15/03/24.
//

import SwiftUI

// badges can be used in lists, rows and tab bars and menus.

struct BadgesLearning: View {
    var body: some View {
        TabView {
            Color.blue
                .ignoresSafeArea()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("WWDC 2024")
                }
                .badge(5)
            
            Color.yellow
                .ignoresSafeArea()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Student")
                }
                .badge("New")
            
            Color.indigo
                .ignoresSafeArea()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Challenge")
                }
                .badge("ping")
        }
        .tint(Color.white)
    }
}

#Preview {
    BadgesLearning()
}
