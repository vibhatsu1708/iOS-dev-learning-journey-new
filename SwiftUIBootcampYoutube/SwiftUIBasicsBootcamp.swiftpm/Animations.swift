//
//  Animations.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 06/03/24.
//

import SwiftUI

struct Animations: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isAnimated.toggle()
            } label: {
                Text("Button")
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 1000.0 : 15.0)
                .foregroundStyle(isAnimated ? Color.indigo : Color.blue)
                .frame(width: isAnimated ? 300 : 200, height: isAnimated ? 300 : 200)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 200 : 0)
                .animation(Animation.default, value: isAnimated)
            
            Spacer()
        }
    }
}

#Preview {
    Animations()
}
