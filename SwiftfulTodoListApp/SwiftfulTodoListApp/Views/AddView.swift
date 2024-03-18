//
//  AddView.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct AddView: View {
    @State var textfieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Your todo here...", text: $textfieldText)
                    .padding()
                    .background(Color.secondary.opacity(0.3))
                    .frame(height: 55)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                Divider()
                
                Button {
                    
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
            }
            .padding()
        }
        .navigationTitle("Add an item!")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
