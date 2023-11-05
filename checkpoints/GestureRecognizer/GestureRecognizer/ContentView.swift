//
//  ContentView.swift
//  GestureRecognizer
//
//  Created by Vedant Mistry on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonFlag: Bool = false
    
    var body: some View {
        Text("Tap here!")
        
        .padding()
        .background(buttonFlag ? Color.green : Color.orange)
        .foregroundStyle(Color.black)
        .font(.title)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .onTapGesture {
            buttonFlag.toggle()
        }
    }
}

#Preview {
    ContentView()
}
