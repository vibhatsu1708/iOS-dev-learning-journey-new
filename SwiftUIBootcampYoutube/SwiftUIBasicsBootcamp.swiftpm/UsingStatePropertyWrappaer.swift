//
//  UsingStatePropertyWrappaer.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 05/03/24.
//

import SwiftUI

struct UsingStatePropertyWrappaer: View {
    @State private var backgroundColor: Color = Color.yellow
    @State private var myTitle: String = "Title"
    @State private var buttonPressed: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(buttonPressed)")
                    .font(.title)
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColor = Color.orange
                        myTitle = "Button 1 was pressed"
                        buttonPressed += 1
                    }
                    .padding()
                    .clipShape(Capsule())
                    
                    Button("Button 2") {
                        backgroundColor = Color.blue
                        myTitle = "Button 2 was pressed"
                        buttonPressed += 1
                    }
                    .padding()
                    .clipShape(Capsule())
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    UsingStatePropertyWrappaer()
}
