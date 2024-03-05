//
//  AnimationsCurvesTimings.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 06/03/24.
//

import SwiftUI

struct AnimationsCurvesTimings: View {
    @State var isAnimation: Bool = false
    let timing: Double = 1.0
    
    var body: some View {
        VStack {
            Button {
                isAnimation.toggle()
            } label: {
                Text("Button")
            }
            
            RoundedRectangle(cornerRadius: isAnimation ? 20.0 : 10000.0)
                .frame(width: isAnimation ? 350 : 50, height: isAnimation ? 100 : 50)
                .animation(Animation.spring, value: isAnimation)
//
//            RoundedRectangle(cornerRadius: 20.0)
//                .frame(width: isAnimation ? 350 : 50, height: 100)
//                .animation(Animation.easeIn(duration: timing), value: isAnimation)
//            
//            RoundedRectangle(cornerRadius: 20.0)
//                .frame(width: isAnimation ? 350 : 50, height: 100)
//                .animation(Animation.easeOut(duration: timing), value: isAnimation)
//            
//            RoundedRectangle(cornerRadius: 20.0)
//                .frame(width: isAnimation ? 350 : 50, height: 100)
//                .animation(Animation.easeInOut(duration: timing), value: isAnimation)
//            RoundedRectangle(cornerRadius: 20.0)
//                .frame(width: isAnimation ? 350 : 50, height: 100)
//                .animation(Animation.bouncy(duration: timing), value: isAnimation)
//            RoundedRectangle(cornerRadius: 20.0)
//                .frame(width: isAnimation ? 350 : 50, height: 100)
//                .animation(Animation.spring(duration: timing), value: isAnimation)
        }
    }
}

#Preview {
    AnimationsCurvesTimings()
}
