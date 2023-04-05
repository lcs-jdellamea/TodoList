//
//  TodoItem.swift
//  TodoList
//
//  Created by Jack Dellamea on 4/3/23.
//

import Blackbird
import Foundation

struct TodoItem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var completed: Bool
}

var existingTodoItems = [

    TodoItem(id: 1, description: "Study for Physics Quiz", completed: false)
    
    ,
    
    TodoItem(id: 2, description: "Finish Computer Science assignment", completed: true)
    
    ,
    
    TodoItem(id: 3, description: "Go for a run", completed: false)
    
    ,
]
