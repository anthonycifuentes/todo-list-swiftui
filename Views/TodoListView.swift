//
//  TodoListView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

struct TodoListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "My first task", isCompleted: true),
        ItemModel(title: "Second task", isCompleted: false),
        ItemModel(title: "Third", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To-do List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink(destination: AddView()) {
                    Text("Add")
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
    }
}

