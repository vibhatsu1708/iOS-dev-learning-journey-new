//
//  Initializers.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 04/03/24.
//

import SwiftUI

struct Initializers: View {
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .bananas:
            self.title = "Bananas"
            self.backgroundColor = .yellow
        case .apples:
            self.title = "Apples"
            self.backgroundColor = .red
        case .oranges:
            self.title = "Oranges"
            self.backgroundColor = .orange
        case .berries:
            self.title = "Berries"
            self.backgroundColor = .indigo
        }
    }
    
    enum Fruit {
        case apples, oranges, berries, bananas
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .underline()
            Text(title)
                .font(.headline)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    HStack {
        Initializers(count: 7, fruit: .apples)
        Initializers(count: 5, fruit: .berries)
    }
}
