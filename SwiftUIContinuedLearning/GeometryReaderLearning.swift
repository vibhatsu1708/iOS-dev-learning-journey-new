//
//  GeometryReaderLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 21/03/24.
//

import SwiftUI

struct GeometryReaderLearning: View {
    func getPercentage(geometry: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geometry.frame(in: .global).midX
        
        return Double(1 - currentX / maxDistance)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<20) { index in
                    // add the frame on the geometry reader instead of the shape, because the geometry reader needs to know the exact size of it.
                    GeometryReader { geomtry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geometry: geomtry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .foregroundStyle(Color.blue)
                }
            }
            .padding()
        }
        
//        GeometryReader { geomtry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .foregroundStyle(Color.yellow)
//                    .frame(width: geomtry.size.width * 0.666666666666666)
//                Rectangle()
//                    .foregroundStyle(Color.orange)
//            }
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    GeometryReaderLearning()
}
