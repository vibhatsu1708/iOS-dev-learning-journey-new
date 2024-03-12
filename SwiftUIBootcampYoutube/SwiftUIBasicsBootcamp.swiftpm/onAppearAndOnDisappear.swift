//
//  onAppearAndOnDisappear.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

struct onAppearAndOnDisappear: View {
    @State var myText: String = "This text will change after 1 second"
    @State var rectanglesAppeared: Int = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .padding()
                            .frame(height: 200)
                            .onAppear {
                                rectanglesAppeared += 1
                            }
                    }
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    myText = "The new text has appeared!"
                }
            }
            .onDisappear {
                // won't be visible but this is executed when the user leaves this view or this scene
            }
            .navigationTitle("Rectangles: \(rectanglesAppeared)")
        }
    }
}

#Preview {
    onAppearAndOnDisappear()
}
