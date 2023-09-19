//
//  ProductModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 16/09/23.
//

import Foundation

struct ProductsModel: Codable {
    let products: [ProductModel]
    let total, skip, limit: Int
}

struct ProductModel: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
