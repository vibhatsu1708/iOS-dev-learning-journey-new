//
//  systemMaterialsAndBackgrounds.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 15/03/24.
//

import SwiftUI

struct systemMaterialsAndBackgrounds: View {
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Hello")
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
        }
        .ignoresSafeArea()
        .background {
            AsyncImage(
                url: url) { returnedImage in
                    returnedImage
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding()
                } placeholder: {
                    ProgressView()
                }

        }
    }
}

#Preview {
    systemMaterialsAndBackgrounds()
}
