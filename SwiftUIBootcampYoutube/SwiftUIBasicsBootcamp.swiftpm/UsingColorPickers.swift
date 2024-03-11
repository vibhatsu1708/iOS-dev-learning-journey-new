//
//  UsingColorPickers.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 12/03/24.
//

import SwiftUI

struct UsingColorPickers: View {
    @State var backgroundColor: Color = .indigo
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ColorPicker("Select a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .font(.headline)
            .foregroundStyle(Color.white)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .padding(50)
        }
    }
}

#Preview {
    UsingColorPickers()
}
