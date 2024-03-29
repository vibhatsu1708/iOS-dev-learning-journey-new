//
//  AddReminderView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 16/12/23.
//

import SwiftUI
import CoreData

struct AddReminderView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var reminder_desc: String = ""
    @State private var completed: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Reminder Name", text: $name, axis: .vertical)
                            .foregroundStyle(Color.newFont)
                            .font(.headline)
                            .bold()
                        
                        TextField("Reminder Description", text: $reminder_desc, axis: .vertical)
                            .foregroundStyle(Color.newFont)
                            .font(.subheadline)
                    }
                }
                Group {
                    Button {
                        if name.trimmingCharacters(in: .whitespaces) == "" {
                            name = "New Reminder"
                        }
                        if reminder_desc.trimmingCharacters(in: .whitespaces) == "" {
                            reminder_desc = "Reminder Description"
                        }
                        DataController().addReminder(name: name, reminder_desc: reminder_desc, completed: completed, context: managedObjectContext)
                        dismiss()
                    } label: {
                        Label("Add Reminder", systemImage: "plus")
                    }
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(LinearGradient(colors: [Color(UIColor(hex: "F3C178")), Color(UIColor(hex: "FE5E41"))], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundStyle(Color(UIColor(hex: "F8F7FF")))
                    .clipShape(RoundedRectangle(cornerRadius: 1000.0))
                }
            }
            .navigationTitle("New Reminder")
        }
    }
}

#Preview {
    AddReminderView()
}
