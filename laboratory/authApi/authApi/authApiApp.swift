
import SwiftUI
import Firebase
@main
struct authApiApp: App {
    
    @StateObject var dataManager = DataManajer()
    
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
