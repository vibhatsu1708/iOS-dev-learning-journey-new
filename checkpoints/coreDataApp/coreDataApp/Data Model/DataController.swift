//
//  DataController.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 11/12/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ExpenseModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    //to save the data
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("Data couldn't be saved!")
        }
    }
    
    func addItem(name: String, cost: Double, desc: String, context: NSManagedObjectContext) {
        let item = Item(context: context)
        item.id = UUID()
        item.date = Date()
        item.name = name
        item.cost = cost
        item.desc = desc
        
        save(context: context)
    }
    
    func editItem(item: Item, name: String, cost: Double, desc: String, context: NSManagedObjectContext) {
        item.date = Date()
        item.name = name
        item.cost = cost
        item.desc = desc
        
        save(context: context)
    }
}
