//
//  ListViewModel.swift
//  todoapp
//
//  Created by Saif on 20/05/2023.
//

import Foundation

class ListViewModel:ObservableObject{
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        createDummyItems()
    }
    
    let itemKey:String = "item_key"
    
    func createDummyItems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
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
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
