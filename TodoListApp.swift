//
//  TodoListApp.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
