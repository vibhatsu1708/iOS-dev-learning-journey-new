//
//  AddItemView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 11/12/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var cost: Double = 0.0
    @State private var desc: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Item name", text: $name)
                
                VStack {
                    TextField("Item cost", value: $cost, format: .number)
                    TextField("Item description", text: $desc)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Add") {
                        DataController().addItem(name: name, cost: cost, desc: desc, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddItemView()
}
