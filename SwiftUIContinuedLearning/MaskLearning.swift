//
//  MaskLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 22/03/24.
//

import SwiftUI

struct MaskLearning: View {
    @State var rating: Int = 3
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
        .padding()
        .background(Color.black)
        .clipShape(Capsule())
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(LinearGradient(colors: [Color.indigo, Color.blue, Color.teal], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(Animation.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskLearning()
}
