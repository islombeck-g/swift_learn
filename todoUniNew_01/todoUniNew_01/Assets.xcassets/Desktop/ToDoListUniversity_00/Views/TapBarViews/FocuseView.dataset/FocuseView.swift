
import SwiftUI

struct FocuseView: View {
    var me = "ssss"
    var body: some View {
        VStack{
            Text("FocusView \(me)")
            Image(systemName: "clock")
        }
        
    }
}

struct FocuseView_Previews: PreviewProvider {
    static var previews: some View {
        FocuseView()
    }
}
