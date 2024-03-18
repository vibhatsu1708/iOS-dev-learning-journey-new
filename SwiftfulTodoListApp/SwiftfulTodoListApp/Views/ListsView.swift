//
//  ListsView.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ListsView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        if listViewModel.items.isEmpty {
            ContentUnavailableView(
                "Not items in the list",
                systemImage: "checkmark",
                description: Text("Add items to list by clicking on the \"Add\" button in the top right corner."))
        }
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .swipeActions(edge: .leading) {
                        Button {
                            listViewModel.completeItem(item: item)
                        } label: {
                            Text(item.isCompleted ? "Undone" : "Done")
                        }
                    }
            }
            .onDelete(perform: { indexSet in
                listViewModel.deleteItem(indexSet: indexSet)
            })
            .onMove(perform: { indices, newOffset in
                listViewModel.moveItem(from: indices, to: newOffset)
            })
        }
        .navigationTitle("Todo list")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListsView()
            .environmentObject(ListViewModel())
    }
}
