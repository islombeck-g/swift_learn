
import SwiftUI

struct ChangeView<Content>: View where Content:View {
    var content:()->Content
    var body: some View {
        content()
    }
}




//struct changeView_Previews: PreviewProvider {
//    static var previews: some View {
//        changeView()
//    }
//}
