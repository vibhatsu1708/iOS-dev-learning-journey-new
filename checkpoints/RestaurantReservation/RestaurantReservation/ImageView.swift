//
//  TopView.swift
//  RestaurantReservation
//
//  Created by Vedant Mistry on 05/11/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("restaurant")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 5.0)
            }
            .padding()
    }
}

#Preview {
    ImageView()
}
