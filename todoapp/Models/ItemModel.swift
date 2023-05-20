//
//  ItemModel.swift
//  todoapp
//
//  Created by Saif on 14/05/2023.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
