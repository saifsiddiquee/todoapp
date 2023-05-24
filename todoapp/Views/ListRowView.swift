//
//  ListRowView.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let itemModel: ItemModel
   
    var body: some View {
        HStack{
            Image(systemName: itemModel.isCompleted
                  ? "checkmark.circle"
                  : "circle"
            )
            .foregroundColor(itemModel.isCompleted ? .green : .orange)
            
            Text(itemModel.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First Title", isCompleted: false)
    static var item2 = ItemModel(title: "Second Title", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(itemModel: item1)
            ListRowView(itemModel: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
