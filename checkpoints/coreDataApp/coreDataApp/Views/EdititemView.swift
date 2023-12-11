//
//  EdititemView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 11/12/23.
//

import SwiftUI

struct EdititemView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var item: FetchedResults<Item>.Element
    
    @State private var name = ""
    @State private var cost: Double = 0.0
    @State private var desc: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("\(item.name!)", text: $name)
                    .onAppear {
                        name = item.name!
                        cost = item.cost
                        desc = item.desc!
                    }
                VStack {
                    Text("Cost: \(item.cost)")
                    TextField("Item cost", value: $cost, format: .number)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Add") {
                        DataController().editItem(item: item, name: name, cost: cost, desc: desc, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}
