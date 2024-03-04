//
//  ignoringSafeArea.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 05/03/24.
//

import SwiftUI

struct ignoringSafeArea: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding(20)
                }
            }
        }
        .background(
            Color.indigo
                .ignoresSafeArea()
        )
        
        
        
//        VStack {
//            Text("Ignoring safe area")
//            Spacer()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.indigo)
//        .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
    }
}

#Preview {
    ignoringSafeArea()
}
