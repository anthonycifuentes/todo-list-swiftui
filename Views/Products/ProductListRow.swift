//
//  ProductListRow.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 18/09/23.
//

import SwiftUI

struct ProductListRow: View {
    let product: ProductModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120)
            VStack(alignment: .leading) {
                Text(product.title)
                    .bold()
                Text("USD $\(product.price)")
                    .font(.caption)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct ProductListRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductListRow(product: ProductModel(id: 1, title: "My Product", description: "My Product Description", price: 14,  rating: 1.0, stock: 1, brand: "Brand", category: "Gadget", thumbnail: "https://www.apple.com/newsroom/images/2023/09/apple-unveils-iphone-15-pro-and-iphone-15-pro-max/article/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.xlarge_2x.jpg", images: []))
        }
    }
}
