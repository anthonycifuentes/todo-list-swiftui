//
//  TodoListView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

struct TodoListView: View {
        
    @EnvironmentObject var listViewModel: ListViewModel
  
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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
        .environmentObject(ListViewModel())
    }
}

