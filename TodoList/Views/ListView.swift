//
//  ListView.swift
//  TodoList
//
//  Created by Jack Dellamea on 4/3/23.
//

import SwiftUI

struct ListView: View {
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: Binding.constant(""))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                    
                }
                .padding(20)
                
                List(existingTodoItems) { currentItem in
                    
                }
                
            }
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
