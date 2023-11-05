//
//  magnificationGestureView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct magnificationGestureView: View {
    @State private var amount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                    .scaleEffect(amount + finalAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                amount = value - 1
                            }
                            .onEnded { value in
                                finalAmount += amount
                                amount = 0
                            }
                    )
                Spacer()
                Text("MagnigicationGesture(), applies the magnification gesture to the image, the variables store the relative amount of magnification applied at one time and the total amount of magnification applied to the view, thus adding all the magnification that happened at the start.")
            }.padding()
        }
        .navigationTitle("MagnificationGesture")
    }
}

#Preview {
    magnificationGestureView()
}
