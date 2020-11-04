//
//  AddTodoView.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 11/1/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    @State private var newTodo = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Text("Todo: ")
                TextField("Enter to-do", text: $newTodo)
            }
            
            Button(action: {
                addNewToDo()
            }, label: {
                Text("Add new")
            })
        }
    }
    
    func addNewToDo() {
        if !newTodo.isEmpty {
           // add to Fb
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
