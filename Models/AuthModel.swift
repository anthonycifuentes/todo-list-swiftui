//
//  AuthModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 19/09/23.
//

import Foundation

struct AuthModel: Codable {
    let user: UserModel?
    let isAuth: Bool
}

struct UserModel: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String?
}

struct CredentialsModel: Codable {
    let username: String
    let password: String
}
