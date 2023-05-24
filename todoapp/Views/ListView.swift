//
//  ListView.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items.indices, id: \.self) { index in
                ListRowView(itemModel: listViewModel.items[index])
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: listViewModel.items[index])
                        }
                    }
                    .listRowBackground((index  % 2 == 0)
                                       ? Color(.white)
                                       : Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                

            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)

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
        .environmentObject(ListViewModel())
    }
}

