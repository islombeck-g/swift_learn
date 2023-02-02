
import SwiftUI

@main
struct todoUni_03App: App {
    @StateObject var focuseModel: FocuseModel = .init ()
    var body: some Scene {
        WindowGroup {
            MainView(data: DataController())
                .environmentObject(focuseModel)
        }
    }
}




