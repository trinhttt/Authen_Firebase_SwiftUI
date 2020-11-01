//
//  TodoRow.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 11/1/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    var body: some View {
        Text(todo.todo)
        Spacer()
        if todo.isComplete {
            Image(systemName: "checkmark").imageScale(.medium)
        } else {
            Image(systemName: "xmark").imageScale(.medium)
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo(todo: "", isComplete: false))
    }
}
