//
//  ButtonStylesLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 15/03/24.
//

import SwiftUI

struct ButtonStylesLearning: View {
    var body: some View {
        VStack {
            Button("Button action") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(BorderedButtonStyle())
            .controlSize(.regular)
            
            Button("Button action") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(BorderedProminentButtonStyle())
            .controlSize(.small)
            
            Button("Button action") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(BorderlessButtonStyle())
            .controlSize(.large)
            
            if #available(iOS 17.0, *) {
                Button("Button action") {
                    
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .buttonStyle(BorderedButtonStyle())
                .controlSize(.extraLarge)
            } else {
                // Fallback on earlier versions
            }
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    ButtonStylesLearning()
}
