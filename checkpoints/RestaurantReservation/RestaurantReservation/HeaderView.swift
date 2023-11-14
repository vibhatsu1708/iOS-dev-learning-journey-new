//
//  HeaderView.swift
//  RestaurantReservation
//
//  Created by Vedant Mistry on 05/11/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            ImageView()
                .frame(width: 150)
            VStack(alignment: .center) {
                Text("Cafe Oceana")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Select a Location")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.gray)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.black, lineWidth: 3.0)
                    }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}
