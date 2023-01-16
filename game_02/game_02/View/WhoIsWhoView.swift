
import SwiftUI

struct WhoIsWhoView: View {
    
    @ObservedObject var s: GameSettingsViewModel
    //let names = ["John", "Emily", "Michael", "Sarah", "Jessica"]
    
    @State public var currentIndex:Int = 0
    
    var body: some View {
        VStack {
            Text("Current name: \(s.getName(index: currentIndex))")
            Button("Switch") {
                self.currentIndex = self.currentIndex + 1
                
            }
        }
    }
}




struct WhoIsWhoView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsWhoView(s:GameSettingsViewModel())
    }
}
