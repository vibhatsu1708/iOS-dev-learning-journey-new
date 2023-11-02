//
//  SpidermanLogo.swift
//  passingData
//
//  Created by Vedant Mistry on 01/11/23.
//

import SwiftUI

struct SpidermanLogo: View {
    @Binding var bindingShowLogo: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "apple.terminal.fill")
            Button(action: {
                bindingShowLogo.toggle()
            }, label: {
                Text("Logo visibility")
                    .font(.title2)
            })
        }
    }
}

#Preview {
    SpidermanLogo(bindingShowLogo: .constant(false))
}
