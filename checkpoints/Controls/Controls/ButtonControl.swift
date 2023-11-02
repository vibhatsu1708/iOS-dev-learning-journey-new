//
//  ButtonControl.swift
//  Controls
//
//  Created by Vedant Mistry on 02/11/23.
//

import SwiftUI

struct ButtonControl: View {
    var body: some View {
        Button(action: {
            print("Button clicked!")
        }, label: {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                Text("A Button!")
            }
            .foregroundStyle(Color.black)
            .font(.title2)
            .padding()
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        })
    }
}

#Preview {
    ButtonControl()
}
