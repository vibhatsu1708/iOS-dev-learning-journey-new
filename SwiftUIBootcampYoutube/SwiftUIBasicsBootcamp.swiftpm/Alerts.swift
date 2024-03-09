//
//  Alerts.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 10/03/24.
//

import SwiftUI

struct Alerts: View {
    @State var backgroundColor: Color = Color.white
    @State var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            Button {
                showAlert.toggle()
            } label: {
                Text("Click here")
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .background(Color.indigo)
                    .clipShape(Capsule())
            }
            .alert(
                "Do you want to change the background color?",
                isPresented: $showAlert
                /*presenting: <#T##T?#>, */
            ) {
                Button {
                    backgroundColor = .red
                } label: {
                    Text("to red")
                }
                
                Button {
                    backgroundColor = .purple
                } label: {
                    Text("to purple")
                }
            }
        }
    }
}

#Preview {
    Alerts()
}
