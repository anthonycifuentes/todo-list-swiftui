//
//  LoginView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 19/09/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Button {
            authViewModel.login(credentials: CredentialsModel(username: "kminchelle", password: "0lelplR"))
        } label: {
            Text("LOGIN")
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
