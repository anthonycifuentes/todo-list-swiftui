//
//  ProductsListViewModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 16/09/23.
//

import Foundation
import Alamofire
class ProductsListViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    let API_URL: String = "https://dummyjson.com/products"
    
    
    init(){
//        getProducts { result in
//            switch result {
//            case .success(let products):
//                print(products)
//            case .failure(let error):
//                // Handle the error
//                print("Error fetching products: \(error)")
//            }
//
//        }
        getProducts()
    }
    
    //        func getProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
    //            AF.request(URL)
    //                .validate()
    //                .responseDecodable(of: ProductsModel.self) { response in
    //                    switch response.result {
    //                    case .success(let productsModel):
    //                        self.products = productsModel.products
    //                        completion(.success(self.products))
    //                    case .failure(let error):
    //                        completion(.failure(error))
    //                    }
    //                }
    //        }
    func getProducts() {
        AF.request(API_URL)
            .validate()
            .responseDecodable(of: ProductsModel.self) { response in
                switch response.result {
                case .success(let productsModel):
                    self.products = productsModel.products
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchProducts() {
        let url = URL(string: API_URL)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let productsModel = try JSONDecoder().decode(ProductsModel.self, from: data)
                    self.products = productsModel.products
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

