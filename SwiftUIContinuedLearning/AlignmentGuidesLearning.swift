//
//  AlignmentGuidesLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 10/04/24.
//

import SwiftUI

// what if in your stack, irrespective of the alignment set for your stack, what if you wanted to align an element a little different from the others? This is where the alignment guides come in use.

struct AlignmentGuidesLearning: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello world")
                .background(Color.teal)
                .alignmentGuide(.leading, computeValue: { dimensions in
                    return dimensions.width
                })
            
            // using padding or offset, doesn't change the actual appearance of the stack.
            // adding padding or the offset, doesn't change the actual alignment of the stack, but using the alignment guide changes the actual alignment of the stack.AA
            
            Text("This is some other text")
                .background(Color.orange)
        }
        .font(.title)
        .background(Color.yellow)
    }
}

#Preview {
    AlignmentGuidesLearning()
}
