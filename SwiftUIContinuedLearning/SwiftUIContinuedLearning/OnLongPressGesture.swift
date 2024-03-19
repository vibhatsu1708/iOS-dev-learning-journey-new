//
//  OnLongPressGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 20/03/24.
//

import SwiftUI

struct OnLongPressGesture: View {
    @State var isComplete: Bool = false
    
    var body: some View {
        Text(isComplete ? "Completed" : "Not completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .onLongPressGesture(minimumDuration: 1.5, maximumDistance: 10.0) {
                isComplete.toggle()
            }
    }
}

#Preview {
    OnLongPressGesture()
}
