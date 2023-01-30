
import SwiftUI

@main
struct ToDoListUniversity_00App: App {
    @StateObject private var dataController = DataController()
   // let dataController = ContentView.shared
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    var body: some Scene {
       
        WindowGroup {
            if isOnBoarding{
                WelcomeView()
            }else{
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                
            }
        }
    }
}
