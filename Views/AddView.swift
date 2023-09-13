//
//  AddView.swift
//  TodoList
//
//  Created by Anthony Cifuentes on 12/09/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFielText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type a task...", text: $textFielText)
                    .padding()
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                Button(action: {
                    saveButtonPressed()
                        }) {
                            Text("SAVE")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 56)
                                .background(Color(.systemBlue))
                                .cornerRadius(8)
                        }
            }
            .padding()
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropiate() {
            listViewModel.addItem(title: textFielText)
            presentationMode.wrappedValue.dismiss()
            return
        }
    }
    
    func textIsAppropiate() -> Bool {
        if textFielText.count < 3 {
            alertTitle = "Your note item must be at least 3 characters long! 😔"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        
    }
}
