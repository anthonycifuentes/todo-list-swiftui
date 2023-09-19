//
//  ProductDetailView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 18/09/23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductModel
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: product.thumbnail)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 400, height: 230)
            
            VStack(alignment: .leading){
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
            HStack {
                Text("Price: $\(product.price)")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                Spacer()
            }
            
            HStack {
                Text("Rating:")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(String(format: "%.1f", product.rating))
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            
            HStack {
                Text("In Stock:")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(product.stock)")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Brand:")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(product.brand)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Category:")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(product.category)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle(product.title)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailView(product: ProductModel(id: 1, title: "My Product", description: "My Product Description", price: 14, rating: 1.0, stock: 1, brand: "Brand", category: "Gadget", thumbnail: "https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.xlarge_2x.jpg", images: []))
        }

    }
}
