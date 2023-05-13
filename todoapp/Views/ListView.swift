//
//  ListView.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
       ItemModel(title: "First Title", isCompleted: false),
       ItemModel(title: "Second Title", isCompleted: true),
       ItemModel(title: "Third Title", isCompleted: false)
    ]
    
    var body: some View {
        List{
            
            ForEach(items){item in
                ListRowView(itemModel: item)
                
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To-Do List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        
    }
}

