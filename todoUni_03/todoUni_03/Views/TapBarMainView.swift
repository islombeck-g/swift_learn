
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
            ZStack{
                Rectangle()
                    .fill(Color("dark"))
                    .frame(width: 60, height: 60)
                    .modifier(RoundedCorner(corners: [.topRight, .bottomRight], radius: 15  ))
                
                Button{
                  self.showFocuseView.toggle()
                }label: {
                    HStack{
                        Image(systemName: "timer")
                            .font(.system(size: 25))
                    }
                    .foregroundColor(Color.white)
                    
                    
                }
            }
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color("dark"))
                    .frame(width: 180, height: 60)
                    .modifier(RoundedCorner(corners: [.topLeft, .bottomLeft], radius: 15  ))
                
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
        .background(Color.clear)
        
        
    }
}

//struct TabBarMain_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarMain()
//    }
//}

