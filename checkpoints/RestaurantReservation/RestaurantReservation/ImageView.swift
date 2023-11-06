//
//  TopView.swift
//  RestaurantReservation
//
//  Created by Vedant Mistry on 05/11/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        HStack {
            Image("restaurant")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    ImageView()
}
