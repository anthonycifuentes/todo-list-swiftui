//
//  ProductsListView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 16/09/23.
//

import SwiftUI

struct ProductsListView: View {
    @EnvironmentObject var productsListViewModel : ProductsListViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
       
        List {
            if let firstName = authViewModel.auth.user?.firstName {
                Text("Welcome \(firstName)")
            }
            ForEach(productsListViewModel.products, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductListRow(product: product)
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
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    authViewModel.logOut()
                } label: {
                    Text("LOGOUT")
                        .foregroundColor(.red)
                }

               
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductsListView()
                .environmentObject(ProductsListViewModel())
        }
        
    }
}
