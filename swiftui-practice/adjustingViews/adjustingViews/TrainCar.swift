//
//  TrainCar.swift
//  adjustingViews
//
//  Created by Vedant Mistry on 06/10/23.
//

import SwiftUI

enum TrainSymbol: String {
    case front = "train.side.front.car"
    case middle = "train.side.middle.car"
    case rear = "train.side.rear.car"
}

struct TrainCar: View {
    let position: TrainSymbol
    let showBackground: Bool
    
    init(position: TrainSymbol, showBackground: Bool = true) {
        self.position = position
        self.showBackground = showBackground
    }
    
    var body: some View {
        Image(systemName: position.rawValue)
            .foregroundStyle(Color.black)
            .font(.title)
            .padding()
            .background(Color.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}

#Preview {
    Group {
        HStack {
            TrainCar(position: .front)
            TrainCar(position: .middle)
            TrainCar(position: .rear)
        }
    }
}
