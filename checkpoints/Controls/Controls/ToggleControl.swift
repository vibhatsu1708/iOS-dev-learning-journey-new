//
//  ToggleControl.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct ToggleControl: View {
    @State var isShowing: Bool = true
    
    var body: some View {
        Toggle(isOn: $isShowing, label: {
            if isShowing {
                Label("On", systemImage: "lightbulb.max.fill")
                    .font(.title)
            }
            else {
                Label("On", systemImage: "lightbulb")
                    .font(.title)
            }
        })
        .padding()
    }
}

#Preview {
    ToggleControl()
}
