//
//  AdaptingForDarkMode.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 11/03/24.
//

import SwiftUI

struct AdaptingForDarkMode: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This is primary")
                        .foregroundStyle(Color.primary)
                    Text("This is secondary")
                        .foregroundStyle(Color.secondary)
                    Text("This text is black")
                        .foregroundStyle(Color.black)
                    Text("This text is white")
                        .foregroundStyle(Color.white)
                    
                    Text("This text uses local theme based changes")
                        .foregroundStyle(colorScheme == .light ? .blue : .orange)
                }
            }
            
            .navigationTitle("Learning Dark Mode")
        }
    }
}

#Preview {
    AdaptingForDarkMode()
        .preferredColorScheme(.dark)
}

#Preview {
    AdaptingForDarkMode()
        .preferredColorScheme(.light)
}
