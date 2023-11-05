//
//  onTapGestureView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct onTapGestureView: View {
    @State private var stateCheck: String = "no tap detected"
    var body: some View {
        NavigationStack {
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
                
                    .onTapGesture {
                        stateCheck = "tap detected"
                    }
                Text(stateCheck)
                Spacer()
                Text(".onTapGesture(count: 4), adding the count records the number of taps recorded, and then exectues the corresponding action.")
            }.padding()
        }
        .navigationTitle("onTapGesture")
    }
}

#Preview {
    onTapGestureView()
}
