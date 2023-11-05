//
//  onLongPressGestureView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct onLongPressGestureView: View {
    @State private var stateCheck: String = "No long press detected"
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
                
                    .onLongPressGesture(minimumDuration: 2, maximumDistance: 15, perform: {
                        stateCheck = "Long press detected for set to 2 seconds."
                    })
                Text(stateCheck)
                Spacer()
                Text(".onLongPressGesture(minimumDuration: 5, maximumDistance: 15, perform {}), records the long press for the duration around the points on the screen explicitly mentioned, and then based on the state performs the corresponding action.")
            }.padding()
        }
        .navigationTitle("onLongPressGesture")
    }
}

#Preview {
    onLongPressGestureView()
}
