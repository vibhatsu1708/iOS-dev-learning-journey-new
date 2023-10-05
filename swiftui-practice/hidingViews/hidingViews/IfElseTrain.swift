//
//  IfElseTrain.swift
//  hidingViews
//
//  Created by Vedant Mistry on 06/10/23.
//

import SwiftUI

struct IfElseTrain: View {
    var longTrain: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                
                // In this conditional statement, the middle car doesn't get rendered if the longTrain bool is false.
                if longTrain {
                    Image(systemName: "train.side.middle.car")
                }
                Image(systemName: "train.side.front.car")
            }
            Divider()
            
            // But in this conditional statement, the middle car gets rendered no matter what, but here, only the opacity is toggled.
            HStack {
                Image(systemName: "train.side.rear.car")
                Image(systemName: "train.side.middle.car")
                    .opacity(longTrain ? 1 : 0)
                Image(systemName: "train.side.front.car")
            }
        }
        .font(.title)
    }
}

#Preview {
    Group {
        IfElseTrain(longTrain: true)
        IfElseTrain(longTrain: false)
    }
}
