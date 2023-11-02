//
//  UserForm.swift
//  workingWithTextfields
//
//  Created by Vedant Mistry on 01/11/23.
//

import SwiftUI

struct UserForm: View {
    @State var userName: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        Form {
            TextField("Type your name", text: $userName, onEditingChanged: { editing in
                self.isEditing = editing
                if editing {
                    print("Editing started!")
                }
                else {
                    print("Editing ended!")
                }
            })
                .onChange(of: userName) { oldValue, newValue in
                    print("\(oldValue) -> \(newValue)")
                }
                .onSubmit {
                    print($userName)
                }
        }
    }
}

#Preview {
    UserForm()
}
