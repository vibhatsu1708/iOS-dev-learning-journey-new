//
//  DragGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 20/03/24.
//

import SwiftUI

struct DragGestureLearning: View {
    @State var offset: CGSize = .zero
    @State var onContact: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("\(offset.width)")
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 300, height: 600)
                .foregroundStyle(Color.indigo)
    //            .scaleEffect(onContact ? 1.5 : 1.0)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .padding()
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(Animation.spring) {
                                offset = value.translation
    //                            onContact = true
                            }
                        }
                        .onEnded { value in
                            withAnimation(Animation.spring) {
                                offset = .zero
    //                            onContact = false
                            }
                        }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let maxAmount = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / maxAmount
        
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let maxAmount = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / maxAmount
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureLearning()
}
