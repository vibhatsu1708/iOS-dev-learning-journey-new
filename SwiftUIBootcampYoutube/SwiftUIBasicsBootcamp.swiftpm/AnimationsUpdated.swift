//
//  AnimationsUpdated.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct AnimationsUpdated: View {
    @State private var animate1: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Button("Action 1") {
                    animate1.toggle()
                }
                
                Button("Action 2") {
                    
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .padding()
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
            }
        }
        .animation(.bouncy, value: animate1)
    }
}

#Preview {
    AnimationsUpdated()
}
