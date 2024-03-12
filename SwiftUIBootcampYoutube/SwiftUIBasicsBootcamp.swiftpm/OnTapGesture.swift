//
//  OnTapGesture.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

struct OnTapGesture: View {
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 150)
                .foregroundStyle(isSelected ? Color.green : Color.orange)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .clipShape(Capsule())
            }
            
            Text("TapGesture")
                .padding()
                .font(.title)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .clipShape(Capsule())
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2, perform: {
                    isSelected.toggle()
                })
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnTapGesture()
}
