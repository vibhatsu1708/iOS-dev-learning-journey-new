//
//  dragGestureView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct dragGestureView: View {
    @State private var offsetValue = CGSize.zero
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
                
                    .offset(offsetValue)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offsetValue = gesture.translation
                            }
                        )
                Spacer()
                Text("DragGesture(), allows to track the movement of the user's pointer on the target element, image, at every point the offsetValue is calculated and according the image is moved around based on the pointer.")
            }.padding()
        }
        .navigationTitle("DragGesture")
    }
}

#Preview {
    dragGestureView()
}
