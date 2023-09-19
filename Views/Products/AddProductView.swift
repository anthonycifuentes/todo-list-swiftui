//
//  AddProductView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 18/09/23.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var thumbnail = "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-14-pro-max-colors.png"
    @State private var name = "Iphone 1"
    @State private var description = "First iphone ever"
    @State private var price = 6000
    @State private var isShowingAlert = false
    @EnvironmentObject var productsListViewModel : ProductsListViewModel
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product Details")) {
                    TextField("Product Image URL", text: $thumbnail)
                    TextField("Product Name", text: $name)
                    TextField("Description", text: $description)
                    TextField("Price", value: $price, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                
                Button(action: {
                    saveProduct()
                }) {
                    Text("Save Product")
                }
                .foregroundColor(.blue)
                
            }
            .navigationTitle("Add Product")
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Product Added"),
                    message: Text("The product \(name) has been added successfully."),
                    dismissButton: .default(Text("OK")) {
                        // After successfully adding the product, dismiss the view
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
    }
    func saveProduct() {
        let newProduct = ProductModel(
            id: 0,
            title: name,
            description: description,
            price: price,
            rating: 0,
            stock: 10,
            brand: "apple",
            category: "Phones",
            thumbnail: thumbnail,
            images: []
        )
        productsListViewModel.createProductWithAlamofire(product: newProduct) {
            result in
            switch result {
            case .success(let products):
                print("response--->", products)
                isShowingAlert = true
            case .failure(let error):
                // Handle the error
                print("Error fetching products: \(error)")
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
