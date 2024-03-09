//
//  Lists.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 10/03/24.
//

import SwiftUI

struct Lists: View {
    @State var fruits: [String] = [
        "apples", "bananas", "berries", "pears", "grapes"
    ]
    @State var veggies: [String] = [
        "peas", "carrots", "broccoli", "beans", "potatoes"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.pink)
                }
                
                Section(header: Text("Veggies")) {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                }
            }
            .navigationTitle("Grocery List")
            .toolbar {
                EditButton()
                Button("Add") {
                    add()
                }
            }
            .listStyle(.automatic)
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    func add() {
        fruits.append("new fruit")
    }
}

#Preview {
    Lists()
}
