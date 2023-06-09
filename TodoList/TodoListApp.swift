//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jack Dellamea on 4/3/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                // Make the database available to all other views through the environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
