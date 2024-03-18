//
//  ListRowView.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text("This is the first title")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ListRowView(title: "this is the first title")
}
