//
//  toDoListApp.swift
//  toDoList
//
//  Created by Islombek Gofurov on 16.10.2022.
//  toDoListApp

import SwiftUI

@main
struct TodoListAppTutorialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
