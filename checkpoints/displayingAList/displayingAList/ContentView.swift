//
//  ContentView.swift
//  displayingAList
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct Item: Identifiable {
    var name: String
    var id: UUID = UUID()
    
}

class Model: ObservableObject {
    @Published var menuItems: [Item] = menuItems()
    
    static func menuItems() -> [Item] {
        return [
            Item(name: "Lasagna"),
            Item(name: "Fettuccini Alfredo"),
            Item(name: "Spaghetti"),
            Item(name: "Avocado Toast"),
            Item(name: "Tortellini"),
            Item(name: "Pizza")
        ]
    }
    
}

struct ContentView: View {
    @ObservedObject var model = Model()
    
    var body: some View {
        VStack {
            List {
                ForEach(model.menuItems) { menuItem in
                    Text(menuItem.name)
                }
            }
        }
        .padding()
    }
}
