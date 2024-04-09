//
//  PagingScrollViewLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 10/04/24.
//

import SwiftUI

// scroll bounce behaviour basically dictates that the bounce that happens on scrollviews in general can be toggled on or off based on the number of items present in the view, instead of always happening.

struct PagingScrollViewLearning: View {
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                    RoundedRectangle(cornerRadius: 20.0)
////                        .frame(width: 300, height: 500)
//                        .frame(maxWidth: .infinity)
//                    
//                    // add the padding before the containerRelativeFrame, else the padding just adds up and could misalign the views.
////                        .padding()
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                        .overlay(
//                            Text("\(index)")
//                                .font(.title)
//                                .foregroundStyle(Color.white)
//                        )
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollIndicators(.hidden)
//        .scrollBounceBehavior(.basedOnSize)
//        
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
        
        VStack {
            Button("Scroll to start") {
                scrollPosition = (0..<20).randomElement()!
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        RoundedRectangle(cornerRadius: 20.0)
                            .frame(width: 300, height: 500)
                            .frame(maxWidth: .infinity)
                        
                        // add the padding before the containerRelativeFrame, else the padding just adds up and could misalign the views.
                        //                        .padding()
                            .containerRelativeFrame(.horizontal, alignment: .center)
                            .overlay(
                                Text("\(index)")
                                    .font(.title)
                                    .foregroundStyle(Color.white)
                            )
                            .id(index)
                        
                        
                        // threshold basically says that after a certain point when the view is visible then to perform the animation, like in this case, if the 20% of the rectangle is visible, then perform the animation.
                            .scrollTransition(.animated.threshold(.visible(0.2))) { content, phase in
                                content
                                // isIdentity basically says that if the view is fully rendered on the screen, and present on the screen.
                                    .opacity(phase.isIdentity ? 1.0 : 0.0)
                                    .offset(y: phase.isIdentity ? 0 : 100)
//                                    .blur(radius: phase.isIdentity ? 0.0 : 10.0)
//                                    .rotationEffect(phase.isIdentity ? Angle(degrees: 0) : Angle(degrees: 20))
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollBounceBehavior(.basedOnSize)
            
            // always add the scrollposition to the scrollview, else it wont work.
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
    }
}

#Preview {
    PagingScrollViewLearning()
}
