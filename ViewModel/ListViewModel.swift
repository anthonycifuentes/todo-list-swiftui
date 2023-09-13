//
//  ListViewModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let ITEM_KEY = "ITEM_KEY"
    
    
    init(){
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: ITEM_KEY),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        items = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: ITEM_KEY)
        }
    }
    
}
