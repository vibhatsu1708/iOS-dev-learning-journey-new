//
//  SliderControl.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct SliderControl: View {
    @State private var size: CGFloat = 0.5
    
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .font(.system(size: size*50))
            Spacer()
            Slider(value: $size, in: 0...5)
        }.padding()
    }
}

#Preview {
    SliderControl()
}
