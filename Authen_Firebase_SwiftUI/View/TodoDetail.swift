//
//  TodoDetail.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 11/1/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    @State var complete = false
    var todo: Todo
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            Text(todo.todo)
            Spacer()
            VStack {
                Text("is Complete")
                Button(action: {
                    buttonTapped()
                }, label: {
                    if self.complete {
                        Image(systemName: "checkmark").imageScale(.medium)
                    } else {
                        Image(systemName: "xmark").imageScale(.medium)
                    }
                })
                .onAppear() {
                    self.setupButton()
                }
            }
        })
    }
    
    func setupButton() {
        complete = todo.isComplete
    }
    
    func buttonTapped() {
        if complete {
            complete = false
        } else {
            complete = true
        }
    }
}

//struct TodoDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoDetail()
//    }
//}
