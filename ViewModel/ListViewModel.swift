//
//  ListViewModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        let allItems: [ItemModel] =  [
            ItemModel(title: "My first task", isCompleted: true),
            ItemModel(title: "Second task", isCompleted: false),
            ItemModel(title: "Third", isCompleted: false)]
        
        items.append(contentsOf: allItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
}
