//
//  Grids.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 04/03/24.
//

import SwiftUI

struct Grids: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(0..<30) { index in
                Rectangle()
                    .frame(height: 30)
            }
        })
    }
}

#Preview {
    Grids()
}
