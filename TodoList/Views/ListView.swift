//
//  ListView.swift
//  TodoList
//
//  Created by Jack Dellamea on 4/3/23.
//

import Blackbird
import SwiftUI

struct ListView: View {
    
    // MARK: Stored properties
   
    // Access the connection to the database (needed to add a new record)
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    // The list of items to be completed
    @BlackbirdLiveModels({ db in try await TodoItem.read(from: db)}) var todoItems
    
    //The item currently being added
    @State var newItemDescription: String = " "
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: Binding.constant(""))
                    
                    Button(action: {
                        Task {
                            // Write to database
                            try await db!.transaction { core in
                                try core.query("INSERT INTO TodoItem (description) VALUES (?)", newItemDescription)
                            }
                            
                            // Clear the input field
                            newItemDescription = ""
                        }
                        
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                    
                }
                .padding(20)
                
                List(todoItems.results) { currentItem in
                    
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
