//
//  MainTabView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 18/09/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    @StateObject var productListViewModel: ProductsListViewModel = ProductsListViewModel()
    var body: some View {
        TabView {
            NavigationView{
                ProductsListView()
            }
            .tabItem {
                Image(systemName: "list.bullet.below.rectangle")
            }
            .environmentObject(productListViewModel)
            NavigationView{
                TodoListView()
            }
            .tabItem {
                Image(systemName: "checklist")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
