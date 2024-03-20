//
//  DragGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 20/03/24.
//

import SwiftUI

struct DragGestureLearning: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: 200, height: 200)
            .foregroundStyle(Color.indigo)
            .padding()
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                    }
            )
    }
}

#Preview {
    DragGestureLearning()
}
