//
//  ItemModel.swift
//  SwiftfulTodoListApp
//
//  Created by Vedant Mistry on 18/03/24.
//

import Foundation

struct ItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
