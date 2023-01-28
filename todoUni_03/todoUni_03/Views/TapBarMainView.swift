
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
    //@State private var showAddView = false
    var body: some View {
        HStack{
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color("dark"))
                    .frame(width: 180, height: 60)
                    .modifier(RoundedCorner(corners: [.topLeft], radius: 20))
                
                Button{
                    self.showAddView.toggle()
                }label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add Reminder")
                    }
                    .foregroundColor(Color.white)
                    
                    
                }
            }
        }
        
        
    }
}

//struct TabBarMain_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarMain()
//    }
//}
//
