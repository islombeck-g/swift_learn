
import SwiftUI

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct RoundedCorner: ViewModifier {
    var corners: UIRectCorner
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .clipShape( RoundedCornerShape(corners: corners, radius: radius))
    }
}




struct TabBarMain: View {
    @Binding var showAddView: Bool
    @Binding var showFocuseView: Bool
    //@State private var showAddView = false
    var body: some View {
        HStack{
            //            put here
            Spacer()
            ZStack{
            }
        }
        //  .background(.red)
        .background(Color.clear)
        
        
    }
}

//struct TabBarMain_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarMain()
//    }
//}

