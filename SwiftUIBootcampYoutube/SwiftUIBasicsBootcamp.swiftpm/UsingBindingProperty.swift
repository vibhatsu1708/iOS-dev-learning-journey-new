//
//  UsingBindingProperty.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 06/03/24.
//

import SwiftUI

struct UsingBindingProperty: View {
    @State var backgroundColor: Color = Color.indigo
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundStyle(Color.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    @State var buttonColor: Color = Color.black
    @State var buttonTextColor: Color = Color.white
    
    var body: some View {
        Button {
            backgroundColor = Color.purple
            buttonColor = Color.white
            buttonTextColor = Color.black
            
            title = "New title"
        } label: {
            Text("Button")
                .padding()
                .padding(.horizontal)
                .foregroundStyle(buttonTextColor)
                .background(buttonColor)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    UsingBindingProperty()
}
