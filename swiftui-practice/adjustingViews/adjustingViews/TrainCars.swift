//
//  TrainCars.swift
//  adjustingViews
//
//  Created by Vedant Mistry on 06/10/23.
//

import SwiftUI

struct TrainCars: View {
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Spacing set to 5 points.")
                    .font(.subheadline)
                HStack(spacing: 5) {
                    TrainCar(position: .rear)
                    TrainCar(position: .middle)
                    TrainCar(position: .front)
                }
            }
            VStack {
                Text("Spacing set to 25 points.")
                    .font(.subheadline)
                HStack(spacing: 25) {
                    TrainCar(position: .rear)
                    TrainCar(position: .middle)
                    TrainCar(position: .front)
                }
            }
            VStack {
                Text("Spacing set to 45 points.")
                    .font(.subheadline)
                HStack(spacing: 45) {
                    TrainCar(position: .rear)
                    TrainCar(position: .middle)
                    TrainCar(position: .front)
                }
            }
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}

#Preview {
    TrainCars()
}
