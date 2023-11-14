//
//  ContentView.swift
//  myCalculator
//
//  Created by Vedant Mistry on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button("7", action: {})
                Button("8", action: {})
                Button("9", action: {})
                Button("/", action: {})
            }
            HStack {
                Button("4", action: {})
                Button("5", action: {})
                Button("6", action: {})
                Button("*", action: {})
            }
            HStack {
                Button("1", action: {})
                Button("3", action: {})
                Button("4", action: {})
                Button("+", action: {})
            }
            HStack {
                Button(".", action: {})
                Button("0", action: {})
                Button("=", action: {})
                Button("-", action: {})
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
