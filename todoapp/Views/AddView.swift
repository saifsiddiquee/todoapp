//
//  AddView.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 80)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                
                Button(action: saveItem, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveItem() {
        if(textIsValid()){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsValid() -> Bool {
        if(textFieldText.count<3){
            
            alertTitle = "Text must be 3 charaters long!⚠️⚠️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
