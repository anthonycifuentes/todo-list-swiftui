//
//  ListRowView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

struct ListRowView: View {
    let title: String;
    var body: some View {
            HStack {
                Image(systemName: "circle")
                Text(title)
                Spacer()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "My first taks")
    }
}
