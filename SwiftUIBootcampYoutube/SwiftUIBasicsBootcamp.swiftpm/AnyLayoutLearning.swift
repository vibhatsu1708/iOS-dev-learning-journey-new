//
//  AnyLayoutLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct AnyLayoutLearning: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    // this is done using any layout, the better method
    let layout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        Text("Horizontal: \(horizontalSizeClass.debugDescription)")
        Text("Vertical: \(verticalSizeClass.debugDescription)")
        
        // this is done using any layout, the better method
        let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        layout {
            VStack {
                Text("Better method")
                Text("Text 1")
                Text("Text 2")
                Text("Text 3")
            }
        }
        
        Divider()
        
        
        // this method is not good for complex code bases
        if horizontalSizeClass == .compact {
            // what this basically says, if the horizontal size class, or the horizontal space available is less, then the VStack would be rendered. Basically if it was .compact. And if it was .regular, the HStack would be rendered.
            VStack {
                Text("Older method")
                Text("Text 1")
                Text("Text 2")
                Text("Text 3")
            }
        } else if horizontalSizeClass == .regular {
            HStack {
                Text("Older method")
                Text("Text 1")
                Text("Text 2")
                Text("Text 3")
            }
        }
    }
}

#Preview {
    AnyLayoutLearning()
}
