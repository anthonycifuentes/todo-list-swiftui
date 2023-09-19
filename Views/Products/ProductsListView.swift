//
//  ProductsListView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 16/09/23.
//

import SwiftUI

struct ProductsListView: View {
    @StateObject var productsListViewModel : ProductsListViewModel = ProductsListViewModel()
    var body: some View {
        List {
            ForEach(productsListViewModel.products, id: \.id) { product in
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
                    Image(systemName: "chevron.right")
                }
            }
        }
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddProductView()
                }
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductsListView()
        }
        
    }
}
