//
//  SwipeActionsLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 15/03/24.
//

import SwiftUI

struct SwipeActionsLearning: View {
    @State var fruits: [String] = ["Apple", "Bananas", "Cherries", "Watermelons", "Mangoes"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .tint(Color.indigo)
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button {
                    
                } label: {
                    Image(systemName: "archivebox")
                }
                .tint(Color.green)
            }
        }
    }
}

#Preview {
    SwipeActionsLearning()
}
