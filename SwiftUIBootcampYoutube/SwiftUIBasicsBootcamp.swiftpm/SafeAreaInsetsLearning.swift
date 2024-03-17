//
//  SafeAreaInsetsLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct SafeAreaInsetsLearning: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(height: 200)
            }
            .navigationTitle("Safe Area Insets")
            .safeAreaInset(edge: .bottom) {
                Text("Hello world!")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .clipShape(Capsule())
                    .padding()
            }
        }
    }
}

#Preview {
    SafeAreaInsetsLearning()
}
