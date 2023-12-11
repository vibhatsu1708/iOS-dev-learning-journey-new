//
//  ContentView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 11/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order:.reverse)]) var item: FetchedResults<Item>
    
    @State private var showingAddView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("\(Int(totalExpenseToday()))$ today.")
                    .foregroundStyle(Color.gray)
                    .padding(.horizontal)
                List {
                    ForEach(item) { item in
                        NavigationLink(destination: EdititemView(item: item)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.name!)
                                        .bold()
                                    Text("\(item.cost)")
                                }
                                Spacer()
                                Text(calculateTime(date: item.date!))
                                    .foregroundStyle(Color.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iBudget")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus.circle.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddItemView()
            }
        }
        .navigationViewStyle(.stack)
//        .padding()
    }
    
    private func deleteItem(offsets: IndexSet) {
        withAnimation {
            offsets.map { item[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    
    private func totalExpenseToday() -> Double {
        var expenseToday: Double = 0
        
        for item in item {
            if Calendar.current.isDateInToday(item.date!) {
                expenseToday += item.cost
            }
        }
        return expenseToday
    }
}

#Preview {
    ContentView()
}
