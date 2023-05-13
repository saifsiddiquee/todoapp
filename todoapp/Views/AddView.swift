//
//  AddView.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 80)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(12)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Item 🖊️")
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
