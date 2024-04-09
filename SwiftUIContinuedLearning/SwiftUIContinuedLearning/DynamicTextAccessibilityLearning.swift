//
//  DynamicTextAccessibilityLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 09/04/24.
//

import SwiftUI

struct DynamicTextAccessibilityLearning: View {
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "flame.fill")
                            Text("Welcome to my application")
                        }
                        .font(.title)
                        
                        Text("This is some random text meant to put some text in the view, not for any other reason.")
                            .lineLimit(3)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    }
                    // never use fixed sizes, try to keep the parent view to maxwidth or maxheight.
//                    .frame(height: 100)
                    .background(Color.teal)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hello, world!")
        }
    }
}

extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0

        case .large, .xLarge, .xxLarge:
            return 0.8
            
        default:
            return 0.6
        }
    }
}

#Preview {
    DynamicTextAccessibilityLearning()
}
