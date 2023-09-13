//
//  AddView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFielText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type a task...", text: $textFielText)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                Button(action: {
                            print("Button tapped!")
                        }) {
                            Text("SAVE")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
            }
            .padding()
        }
        .navigationTitle("Add an Item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        
    }
}
