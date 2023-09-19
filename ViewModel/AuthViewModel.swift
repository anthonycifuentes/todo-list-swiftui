//
//  AuthViewModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 19/09/23.
//

import Foundation
import Alamofire

class AuthViewModel: ObservableObject {
    @Published var crendentials: CredentialsModel?
    @Published var auth: AuthModel = AuthModel(user: nil, isAuth: false)
    
    init() {
        if UserDefaults.standard.string(forKey: "AuthToken") != nil && self.auth.user == nil {
            self.auth = AuthModel(user: nil, isAuth: true)
            me()
        }
    }
    
    
    func login(credentials: CredentialsModel){
        AF.request("https://dummyjson.com/auth/login", method: .post, parameters: credentials, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: UserModel.self) { response in
                switch response.result {
                case .success(let userModel):
                    print(userModel)
                    self.auth = AuthModel(user: userModel, isAuth: true)
                    UserDefaults.standard.set(self.auth.user?.token, forKey: "AuthToken")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: "AuthToken")
        self.auth = AuthModel(user: nil, isAuth: false)
    }
    
    
    func me(){
        AF.request("https://dummyjson.com/users/1")
            .validate()
            .responseDecodable(of: UserModel.self) { response in
                switch response.result {
                case .success(let userModel):
                    print(userModel)
                    self.auth = AuthModel(user: userModel, isAuth: true)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
