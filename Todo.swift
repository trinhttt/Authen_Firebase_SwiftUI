//
//  Todo.swift
//  Authen_Firebase_SwiftUI
//
//  Created by Trinh Thai on 10/31/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import SwiftUI

struct Todo: Identifiable {
    let id: String
    let todo: String
    let isComplete: Bool
    let key: String
    
    init(todo: String, isComplete: Bool, key: String = "") {
        self.todo = todo
        self.isComplete = isComplete
        self.key = key
        self.id = key
    }
}
