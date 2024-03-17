//
//  ResizableSheetsLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ResizableSheetsLearning: View {
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Show sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            MyNextView(detents: $detents)
//                .presentationDetents([.medium])
//                .presentationDetents([.fraction(0.1), .large])
            
            
            // only the detents set in this modifier in the array, can be programatically selected. If the array doesn't contain .fraction(0.5), the detents cannot be set to .fraction(0.5). It needs to be included in the array to be able to work.
                .presentationDetents([.medium, .large], selection: $detents)
                .interactiveDismissDisabled()
        })
    }
}

struct MyNextView: View {
    @Binding var detents: PresentationDetent
    
    var body: some View {
        VStack {
            Text("Hello there mate!")
                .padding()
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .background(Color.indigo)
            
            Button("medium") {
                detents = .medium
            }
            Button("large") {
                detents = .large
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    ResizableSheetsLearning()
}
