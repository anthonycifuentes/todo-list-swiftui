//
//  TodoListApp.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authViewModel.auth.isAuth {
                    MainTabView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(authViewModel)
        }
       
    }
}
