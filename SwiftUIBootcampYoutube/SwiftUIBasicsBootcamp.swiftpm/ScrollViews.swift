//
//  ScrollViews.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 04/03/24.
//

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ScrollViews()
}
