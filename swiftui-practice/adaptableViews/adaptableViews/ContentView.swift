//
//  ContentView.swift
//  adaptableViews
//
//  Created by Vedant Mistry on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Hello SwiftUI")
                    .font(.title)
                    .padding()
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                
                Text("Learning iOS Development.")
                    .font(.subheadline)
            }
            
            HStack {
                Image(systemName: "pencil.circle.fill")
                Image(systemName: "trash.circle.fill")
                Image(systemName: "tray.circle.fill")
            }
            .font(.title)
            .symbolRenderingMode(.multicolor)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            VStack(alignment: .leading) {
                Label("Books", systemImage: "books.vertical.circle.fill")
                    .labelStyle(.titleAndIcon)
                    .font(.largeTitle)
                Label("Rain", systemImage: "cloud.rain.circle.fill")
                    .labelStyle(.titleAndIcon)
                    .font(.largeTitle)
                Label("Snow", systemImage: "snowflake.circle.fill")
                    .labelStyle(.titleAndIcon)
                    .font(.largeTitle)
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            .shadow(radius: 15)
            
            VStack(alignment: .leading) {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            }
            
            HStack {
                Circle()
                    .foregroundStyle(.teal)
                    .frame(height: 100)
                Rectangle()
                    .foregroundColor(.indigo)
                    .frame(width: 150, height: 100)
            }
            .padding()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            .shadow(radius: 15)
        }
    }
}

#Preview {
    ContentView()
}
