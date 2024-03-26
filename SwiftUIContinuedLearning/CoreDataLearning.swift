//
//  CoreDataLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 25/03/24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving: \(error)")
        }
    }
    
    func updateFruit(fruit: FruitEntity) {
        let currentName = fruit.name ?? "no name"
        let newName = "name updated!"
        fruit.name = newName
        
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
}

struct CoreDataLearning: View {
    @StateObject var viewModel: CoreDataViewModel = CoreDataViewModel()
    @State var fruitTextfieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add Fruit...", text: $fruitTextfieldText)
                    .padding()
                    .font(.headline)
                    .background(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .padding(.horizontal)
                
                Button {
                    if !fruitTextfieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        viewModel.addFruit(text: fruitTextfieldText)
                        fruitTextfieldText = ""
                    }
                } label: {
                    Text("Add Fruit")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .background(Color.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(viewModel.savedEntities) { fruit in
                        Text(fruit.name ?? "no fruit name")
                            .font(.headline)
                            .onLongPressGesture {
                                viewModel.updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteFruit(indexSet: indexSet)
                    })
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataLearning()
}
