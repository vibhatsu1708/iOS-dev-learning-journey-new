//
//  LocationsView.swift
//  RestaurantReservation
//
//  Created by Vedant Mistry on 06/11/23.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
        VStack {
            EmptyView()
            
            EmptyView()
            
            NavigationStack {
                EmptyView()
                    .navigationTitle("")
                    .toolbar(.hidden)
            }
        }
        .padding()
    }
}

#Preview {
    LocationsView()
}
