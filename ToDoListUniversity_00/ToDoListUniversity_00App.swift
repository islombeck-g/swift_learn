//
//  ToDoListUniversity_00App.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 23.01.2023.
//

import SwiftUI

@main
struct ToDoListUniversity_00App: App {
    @StateObject private var dataController = DataController()
    //let dataController = ContentView.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
