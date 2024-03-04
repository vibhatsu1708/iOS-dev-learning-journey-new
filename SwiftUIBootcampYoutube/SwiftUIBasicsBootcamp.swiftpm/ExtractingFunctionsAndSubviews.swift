//
//  ExtractingFunctionsAndSubviews.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 05/03/24.
//

import SwiftUI

struct ExtractingFunctionsAndSubviews: View {
    @State private var backgroundColor: Color = .yellow
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button {
                buttonPressed()
            } label: {
                Text("Tap Button")
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                    .clipShape(Capsule())
            }
        }
    }
    
    func buttonPressed() {
        backgroundColor = Color.indigo
    }
}

#Preview {
    ExtractingFunctionsAndSubviews()
}
