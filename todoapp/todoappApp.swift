//
//  todoappApp.swift
//  todoapp
//
//  Created by Saif on 13/05/2023.
//

import SwiftUI

@main
struct todoappApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
