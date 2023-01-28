
import SwiftUI

@main
struct ToDoListUniversity_00App: App {
    @StateObject private var dataController = DataController()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
