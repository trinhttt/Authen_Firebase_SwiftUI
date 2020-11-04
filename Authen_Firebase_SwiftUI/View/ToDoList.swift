//
//  ToDoList.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 11/1/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct ToDoList: View {
    var todos: [Todo] = [
        Todo(todo: "Todo 1", isComplete: false, key: "1"),
        Todo(todo: "Todo 2", isComplete: true, key: "2"),
        Todo(todo: "Todo 3", isComplete: false, key: "3"),
        Todo(todo: "Todo 4", isComplete: true, key: "4")
    ]
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: AddTodoView(),
                    label: {
                        Text("Add new")
                })
                List(todos) { todo in
                    NavigationLink(destination: TodoDetail(todo: todo)) {
                        TodoRow(todo: todo)
                    }
                }
            }
        }.navigationBarTitle("TO-DO")
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
