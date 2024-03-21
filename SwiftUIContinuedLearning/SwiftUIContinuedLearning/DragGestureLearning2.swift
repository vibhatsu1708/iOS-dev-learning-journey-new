//
//  SwiftUIView.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 20/03/24.
//

import SwiftUI

struct DragGestureLearning2: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            SignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingDragOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(Animation.spring) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(Animation.spring) {
                                if currentDragOffsetY < -150 {
                                    endingDragOffsetY = -startingOffsetY
                                } else if endingDragOffsetY != 0 && currentDragOffsetY > -150 {
                                    endingDragOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                            
                            withAnimation(Animation.spring) {
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureLearning2()
}

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.bold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text("This is the description. SwiftUI is the future of ios development.")
                .multilineTextAlignment(.center)
            
            Text("Create an account")
                .padding()
                .foregroundStyle(Color.white)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 40.0))
    }
}
