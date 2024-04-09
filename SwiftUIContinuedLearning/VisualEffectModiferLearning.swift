//
//  VisualEffectModiferLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 10/04/24.
//

import SwiftUI

struct VisualEffectModiferLearning: View {
    var body: some View {
        // Geomtry readers are computationally expensive, and using a geometry reader gives the dimensions of the geometry reader, so to be able to get the dimensions of the element, the visual effect modifier is used.
//        GeometryReader { proxy in
//            Text("Hello, World!")
//                .padding()
//                .background(Color.mint)
//                .grayscale(1.0)
//        }
//        .background(Color.mint)
//        .padding()
//        .frame(width: 200)
        
        
        
        // Using the visual effect modifier
//        Text("Hello, World!")
//            .padding()
//            .background(Color.mint)
//            .visualEffect { content, geometry in
//                content
//                    .grayscale(geometry.size.width >= 200 ? 1.0 : 0.0)
//            }
        
        
        // Using the visual effect modifier on a scrollview
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .visualEffect { content, geometryProxy in
                            content
                                .offset(x: geometryProxy.frame(in: .global).minY * 0.05)
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    VisualEffectModiferLearning()
}
