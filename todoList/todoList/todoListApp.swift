//
//  todoListApp.swift
//  todoList
//
//  Created by Islombek Gofurov on 14.10.2022.
//

import SwiftUI

@main
struct todoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
