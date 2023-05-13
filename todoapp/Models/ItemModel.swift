//
//  ItemModel.swift
//  todoapp
//
//  Created by Saif on 14/05/2023.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
