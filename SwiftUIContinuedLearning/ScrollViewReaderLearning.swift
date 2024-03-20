//
//  ScrollViewReaderLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 21/03/24.
//

import SwiftUI

struct ScrollViewReaderLearning: View {
    @State var lineNumber: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a number here...", text: $lineNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .frame(height: 50)
                    .foregroundStyle(Color.white)
                    .background(Color.green)
                    .clipShape(Capsule())
                Button {
                    scrollToIndex = Int(lineNumber) ?? 0
                    
                } label: {
                    Text("Scroll")
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
            }
            .padding()
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item number: \(index)")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(Animation.spring) {
                            proxy.scrollTo(scrollToIndex, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderLearning()
}
