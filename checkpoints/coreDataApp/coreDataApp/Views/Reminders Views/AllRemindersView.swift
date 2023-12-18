//
//  AllRemindersView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 16/12/23.
//

import SwiftUI
import CoreData

struct AllRemindersView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var reminders: FetchedResults<Reminder>

    @State private var searchText: String = ""
    
    var filteredReminders: [Reminder] {
        guard !searchText.isEmpty else { return Array(reminders) }
        return reminders.filter {
            ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.reminder_desc?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
    }

    @State private var showingAddReminder: Bool = false
    @State private var showingEditReminder: Bool = false
    @State private var selectedReminder: Reminder?
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(alignment: .leading) {
                    List {
                        ForEach(reminders) { reminder in
                            NavigationLink(destination: EditReminderView(reminder: reminder)) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(reminder.completed ? "Completed" : "Not Completed")
                                                .padding(.vertical, 5)
                                                .padding(.horizontal, 8)
                                                .font(.caption2)
                                                .foregroundStyle(.tertiary)
                                                .bold()
                                                .italic()
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 1000.0)
                                                        .stroke(reminder.completed ? Color(UIColor(hex: "5863F8")): Color(UIColor(hex: "FF686B")), lineWidth: 4)
                                                }
                                            Text(reminder.name!)
                                                .font(.headline)
                                                .bold()
                                        }
                                        
                                        Text(reminder.reminder_desc!)
                                            .font(.subheadline)
                                        
                                        Spacer()
                                        
                                        Text(calculateTime(date: reminder.date!))
                                            .font(.caption)
                                            .foregroundStyle(Color.gray)
                                            .italic()
                                    }
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    reminder.completed.toggle()
                                    print(reminder.completed)
                                } label: {
                                    Label("Done", systemImage: "checklist.checked")
                                }
                            }
                        }
                        .onDelete(perform: deleteReminder)
                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                }
                .navigationTitle("Your Reminders")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .searchable(text: $searchText)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack() {
                        Button(action: {
                            showingAddReminder.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddReminder) {
                            AddReminderView()
                        }
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    .background(LinearGradient(colors: [Color(UIColor(hex: "F3C178")), Color(UIColor(hex: "FE5E41"))], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundStyle(Color(UIColor(hex: "F8F7FF")))
                    .clipShape(RoundedRectangle(cornerRadius: 1000.0))
                    .shadow(radius: 30)
                }
            }
            .padding(30)
        }
    }
    
    private func deleteReminder(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                reminders[$0]
            }.forEach(managedObjectContext.delete)
            
            DataController().save(context: managedObjectContext)
        }
    }
}

#Preview {
    AllRemindersView()
}
