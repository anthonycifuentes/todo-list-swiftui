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
        getProductsWitAlamofire()
    }
    
    func getProductsWitAlamofireAndEscaping(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        AF.request(API_URL)
            .validate()
            .responseDecodable(of: ProductsModel.self) { response in
                switch response.result {
                case .success(let productsModel):
                    self.products = productsModel.products
                    completion(.success(self.products))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getProductsWithURLSession() {
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
    func getProductsWitAlamofire() {
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
    
    func createProductWithAlamofire(product: ProductModel, completion: @escaping (Result<ProductModel, Error>) -> Void){
        AF.request(API_URL+"/add", method: .post, parameters: product, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: ProductModel.self){ response in
                switch response.result {
                case .success(let createdItem):
                    self.products.insert(product, at: 0)
                    completion(.success(createdItem))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

