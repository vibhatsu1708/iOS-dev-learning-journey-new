//
//  rotationGestureView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct rotationGestureView: View {
    @State private var amount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
                
                    .rotationEffect(amount + finalAmount)
                    .gesture(
                        RotationGesture()
                            .onChanged { value in
                                amount = value
                            }
                            .onEnded { value in
                                finalAmount += amount
                                amount = .zero
                            }
                    )
                
                Spacer()
                Text("RotationGesture")
            }.padding()
        }
        .navigationTitle("RotationGesture")
    }
}

#Preview {
    rotationGestureView()
}
