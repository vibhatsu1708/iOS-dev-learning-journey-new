//
//  Transitions.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 07/03/24.
//

import SwiftUI

struct Transitions: View {
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    withAnimation(Animation.spring) {
                        showView.toggle()
                    }
                } label: {
                    Text("Button")
                }
                
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30.0)
                    .frame(height: UIScreen.main.bounds.height/2)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Transitions()
}
