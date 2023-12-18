//
//  AllNotesView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 15/12/23.
//

import SwiftUI
import CoreData

struct AllNotesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var notes: FetchedResults<Note>

    @State private var searchText: String = ""

    var filteredNotes: [Note] {
        guard !searchText.isEmpty else { return Array(notes) }
        return notes.filter { 
            ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.note_desc?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
    }
    
    @State private var showingAddNote: Bool = false
    @State private var showingEditNote: Bool = false
    @State private var selectedNote: Note?
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(alignment: .leading) {
                    List {
                        ForEach(filteredNotes) { note in
                            NavigationLink(destination: EditNoteView(note: note)) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(note.name!)
                                            .font(.headline)
                                            .bold()
                                        
                                        Text(note.note_desc!)
                                            .font(.subheadline)
                                        
                                        Spacer()
                                        
                                        Text(calculateTime(date: note.date!))
                                            .font(.caption)
                                            .foregroundStyle(Color.gray)
                                            .italic()
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteNote)
                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                }
                .navigationTitle("Your Notes")
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
                            showingAddNote.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddNote) {
                            AddNoteView()
                        }
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    .background(LinearGradient(colors: [Color(UIColor(hex: "F87666")), Color(UIColor(hex: "8A4FFF"))], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundStyle(Color(UIColor(hex: "F8F7FF")))
                    .clipShape(RoundedRectangle(cornerRadius: 1000.0))
                    .shadow(radius: 30)
                }
            }
            .padding(30)
        }
    }
    
    private func deleteNote(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                notes[$0]
            }.forEach(managedObjectContext.delete)
            
            DataController().save(context: managedObjectContext)
        }
    }
}

#Preview {
    AllNotesView()
}
