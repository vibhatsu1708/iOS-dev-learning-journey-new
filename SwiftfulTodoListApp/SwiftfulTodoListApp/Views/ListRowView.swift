//
//  ListRowView.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            
            Spacer()
        }
    }
}
//
//#Preview {
//    var item1 = ItemModel(title: "This is the first item", isCompleted: true)
//    ListRowView(item: item1)
//}
