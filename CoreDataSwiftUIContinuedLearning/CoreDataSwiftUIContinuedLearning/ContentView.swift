//
//  ContentView.swift
//  CoreDataSwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 25/03/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)]) 
    var fruits: FetchedResults<FruitEntity>
    
    @State var fruitName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    TextField("Add fruit here...", text: $fruitName)
                        .padding()
                        .background(Color.secondary.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    Button {
                        addItem()
                    } label: {
                        Text("Add")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                }
                .padding(.horizontal)
                
                List {
                    ForEach(fruits) { fruit in
                        Text(fruit.name ?? "No fruit name")
                            .onTapGesture {
                                updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            Text("Select an item")
                .navigationTitle("Fruits")
        }
    }

    private func addItem() {
        withAnimation {
            if !fruitName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                let newFruit = FruitEntity(context: viewContext)
                newFruit.name = fruitName

                saveItems()
                fruitName = ""
            }
        }
    }
    
    private func updateItem(fruit: FruitEntity) {
        withAnimation {
            let currentName: String = fruit.name ?? "No fruit name"
            let newName: String = currentName + "heheheheheheh"
            
            fruit.name = newName
            
            saveItems()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            offsets.map { fruits[$0] }.forEach(viewContext.delete)
            
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
            
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
