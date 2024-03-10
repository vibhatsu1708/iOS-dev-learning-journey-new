//
//  ContextMenu.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 11/03/24.
//

import SwiftUI

struct ContextMenu: View {
    @State var backgroundColor: Color = Color.indigo
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Hello world!")
                .font(.headline)
            Text("How to use Content menu!")
                .font(.subheadline)
        }
        .padding()
        .foregroundStyle(Color.white)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .contextMenu(menuItems: {
            Button {
                backgroundColor = .orange
            } label: {
                Label("Share post", image: "flame.fill")
            }
            
            Button {
                backgroundColor = .pink
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Like post")
                }
            }
            
            Button {
                backgroundColor = .gray
            } label: {
                Text("Report Post")
            }
        })
    }
}

#Preview {
    ContextMenu()
}
