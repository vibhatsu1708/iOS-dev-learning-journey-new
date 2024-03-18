//
//  AddView.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var textfieldText: String = ""
    
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
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
                    if !textfieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        listViewModel.addItem(title: textfieldText)
                        dismiss()
                    } else {
                        alertTitle = "Add some text to your todo."
                        showAlert = true
                    }
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
        .alert("Empty title", isPresented: $showAlert) {
            Button("Ok") {}
        }

    }
}

#Preview {
    NavigationStack {
        AddView()
            .environmentObject(ListViewModel())
    }
}
