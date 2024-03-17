//
//  ViewThatFitsLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ViewThatFitsLearning: View {
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            ViewThatFits {
                Text("This is some random random random random random random random random random random text")
                Text("This is some random random random random random random text")
                Text("This is some random random random text")
            }
            
        }
        .frame(height: 300)
        .padding()
    }
}

#Preview {
    ViewThatFitsLearning()
}
