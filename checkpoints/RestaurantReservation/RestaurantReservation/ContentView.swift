//
//  ContentView.swift
//  RestaurantReservation
//
//  Created by Vedant Mistry on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Locations")
                .tabItem {
                    Label("Locations", systemImage: "fork.knife.circle")
                }
            
            Text("Reservations")
                .tabItem {
                    Label("Reservations", systemImage: "square.and.pencil.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
