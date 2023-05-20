//
//  ListViewModel.swift
//  todoapp
//
//  Created by Saif on 20/05/2023.
//

import Foundation

class ListViewModel:ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init(){
        createDummyItems()
    }
    
    func createDummyItems(){
        let newItems = [
            ItemModel(title: "First Title", isCompleted: false),
            ItemModel(title: "Second Title", isCompleted: true),
            ItemModel(title: "Third Title", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompleted()
        }
        
    }
}
