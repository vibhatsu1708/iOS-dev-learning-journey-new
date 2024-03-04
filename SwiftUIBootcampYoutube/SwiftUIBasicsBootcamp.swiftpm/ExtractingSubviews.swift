//
//  ExtractingSubviews.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 05/03/24.
//

import SwiftUI

struct ExtractingSubviews: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            MyItem(title: "Apples", count: 5, color: .red)
            MyItem(title: "Berries", count: 15, color: .indigo)
            MyItem(title: "Oranges", count: 25, color: .orange)
        }
    }
}

#Preview {
    ExtractingSubviews()
}

struct MyItem: View {
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}
