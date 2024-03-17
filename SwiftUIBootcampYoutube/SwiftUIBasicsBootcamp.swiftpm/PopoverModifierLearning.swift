//
//  PopoverModifierLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct PopoverModifierLearning: View {
    @State private var showPopover: Bool = false
    
    var body: some View {
        ZStack {
            Color.indigo
            
            Button("Click me") {
                showPopover.toggle()
            }
            .padding()
            .font(.headline)
            .foregroundStyle(Color.black)
            .background(Color.yellow)
            
            // the popover should be attached to the view it is presenting on, since it is presenting on top of this buttons, it should be put right under it. It will appear on the bounds of the view.
            // the attachment achor specifies on what part of the parent view would it anchor on.
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.topLeading), content: {
                if #available(iOS 16.4, *) {
                    Text("hello world!")
                        .padding()
                        .presentationCompactAdaptation(.popover)
                } else {
                    // Fallback on earlier versions
                }
            })
//            .popover(isPresented: $showPopover, content: {
//                if #available(iOS 16.4, *) {
//                    Text("hello world!")
//                        .padding()
//                        .presentationCompactAdaptation(.popover)
//                } else {
//                    // Fallback on earlier versions
//                }
//            })
        }
    }
}

#Preview {
    PopoverModifierLearning()
}
