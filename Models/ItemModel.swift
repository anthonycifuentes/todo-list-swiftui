//
//  ItemModel.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
