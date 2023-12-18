//
//  DataController.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 12/12/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let dataContainer = NSPersistentContainer(name: "NoteModel")
    
    //MARK: - Data Controller init
    init() {
        dataContainer.loadPersistentStores { desc, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
    
    //MARK: - to save the data
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Successfully saved the Data!")
        } catch {
            print("Data couldn't be saved!")
        }
    }
    
    
    //MARK: - For Notes
    //MARK: - to add a new note
    func addNote(name: String, note_desc: String, context: NSManagedObjectContext) {
        let note = Note(context: context)
        note.id = UUID()
        note.date = Date()
        note.name = name
        note.note_desc = note_desc
        
        save(context: context)
    }
    
    //MARK: - to edit a note
    func editNote(note: Note, name: String, note_desc: String, context: NSManagedObjectContext) {
        note.date = Date()
        note.name = name
        note.note_desc = note_desc
        
        save(context: context)
    }
    
    
    //MARK: - For Reminders
    //MARK: - To add a new Reminder
    func addReminder(name: String, reminder_desc: String, completed: Bool, context: NSManagedObjectContext) {
        let reminder = Reminder(context: context)
        reminder.id = UUID()
        reminder.date = Date()
        reminder.name = name
        reminder.reminder_desc = reminder_desc
        reminder.completed = completed
        
        save(context: context)
    }
    
    //MARK: - To edit a reminder
    func editReminder(reminder: Reminder, name: String, reminder_desc: String, completed: Bool, context: NSManagedObjectContext) {
        reminder.date = Date()
        reminder.name = name
        reminder.reminder_desc = reminder_desc
        reminder.completed = completed
        
        save(context: context)
    }
    
    
    //MARK: - For Purchases
    //MARK: - To add a new Purchase
    func addPurchase(name: String, purchase_desc: String, amount: String, payment_method: String, paid: Bool, spent_or_received: Bool, context: NSManagedObjectContext) {
        let purchase = Purchase(context: context)
        purchase.id = UUID()
        purchase.date = Date()
        purchase.name = name
        purchase.purchase_desc = purchase_desc
        purchase.amount = amount
        purchase.payment_method = payment_method
        purchase.paid = paid
        purchase.spent_or_received = spent_or_received
        
        save(context: context)
    }
    
    //MARK: - To edit a Purchase
    func editPurchase(purchase: Purchase, name: String, purchase_desc: String, amount: String, payment_method: String, paid: Bool, spent_or_received: Bool, context: NSManagedObjectContext) {
        purchase.date = Date()
        purchase.name = name
        purchase.purchase_desc = purchase_desc
        purchase.amount = amount
        purchase.payment_method = payment_method
        purchase.paid = paid
        purchase.spent_or_received = spent_or_received
        
        save(context: context)
    }
}

