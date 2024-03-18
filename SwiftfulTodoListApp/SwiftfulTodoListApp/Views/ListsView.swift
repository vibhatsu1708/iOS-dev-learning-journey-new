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
