//
//  ListView.swift
//  TodoList
//
//  Created by Jack Dellamea on 4/3/23.
//

import SwiftUI

struct ListView: View {
    
    // MARK: Stored properties
    // The list of items to be completed
    @State var todoItems: [TodoItem] = existingTodoItems
    
    //The item currently being added
    @State var newItemDescription: String = " "
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: Binding.constant(""))
                    
                    Button(action: {
                        // Get last todo item id
                        let lastId = todoItems.last!.id
                        
                        //Create new tpodo item
                        let newId = lastId + 1
                        
                        //Create the new todo item
                        let newTodoItem = TodoItem(id: newId, description: newItemDescription, completed: false)
                        
                        // Add the new todo item id
                        todoItems.append(newTodoItem)
                        
                        // Clear the input field
                        newItemDescription = ""
                        
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                    
                }
                .padding(20)
                
                List(todoItems) { currentItem in
                    
                    Label(title: {
                        Text(currentItem.description)
                    }, icon: {
                        if currentItem.completed == true {
                        Image(systemName: "checkmark.circle")
                    } else {
                        Image(systemName: "circle")
                    }
                          } )
                    
                }
                
            }
            .navigationTitle("To do")
        }
    }
}
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
    }
}
