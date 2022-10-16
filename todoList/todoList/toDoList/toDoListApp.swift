//
//  toDoListApp.swift
//  toDoList
//
//  Created by Islombek Gofurov on 16.10.2022.
//

import SwiftUI

@main
struct toDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}