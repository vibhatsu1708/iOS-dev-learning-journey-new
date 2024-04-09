//
//  DynamicColorsAccessibilityLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 09/04/24.
//

import SwiftUI

struct DynamicColorsAccessibilityLearning: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    
    var body: some View {
        VStack {
            Button("Button 1") {
                
            }
            .foregroundStyle(Color.primary)
            .buttonStyle(BorderedProminentButtonStyle())
            
            Button("Button 2") {
                
            }
            .foregroundStyle(Color.primary)
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(Color.orange)
            
            Button("Button 3") {
                
            }
            .foregroundStyle(Color.primary)
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(Color.green)
            
            Button("Button 4") {
                
            }
            .foregroundStyle(Color.primary)
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(Color.mint)
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // to check if the user has enabled reduce transparency across the UI.
        .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        // similar thing can be done for increased contrast for the UI appearance.
    }
}

#Preview {
    DynamicColorsAccessibilityLearning()
}
