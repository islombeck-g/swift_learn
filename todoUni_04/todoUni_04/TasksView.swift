
import SwiftUI

struct TasksView: View {
    @ObservedObject var userRegistration = JsonWork()
    @State private var showAddView = false
    @State private var showFocuseView =  false
    @State private var showTaskInfoView = false
    @StateObject var focuseModel: FocuseModel = .init ()
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List(userRegistration.fil.files){ task in
                        
                        Section(
                            header: Text("Next 24 hours")
                                .foregroundColor(Color("dark"))
                        ){
                            Text(task.taskName ?? "error")
                        }
                    }
                }
                if showAddView == false && showFocuseView == false && showTaskInfoView == false{
                    GeometryReader{ geometry in
                        Group{
                            Rectangle()
                                .fill(Color("dark"))
                                .frame(width: 180, height: 60)
                                .modifier(RoundedCorner(corners: [.topLeft, .bottomLeft], radius: 15  ))
                            
                            NavigationLink{
                                //someAction
                            }label: {
                                Label("Напоминание", systemImage: "plus")
                                    .foregroundColor(.white)
                                
                            }
                        }.position(x: geometry.size.width-80, y: geometry.size.height-60)
                        
                        Group{
                            Rectangle()
                                .fill(Color("dark"))
                                .frame(width: 60, height: 60)
                                .modifier(RoundedCorner(corners: [.topRight, .bottomRight], radius: 15  ))
                            
                            NavigationLink{
                                FocuseView()
                                    .environmentObject(focuseModel)
                                
                                
                            }label: {
                                Image(systemName: "timer")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                
                            }
//                            .transition(.move(edge: .trailing)) it is not works
                        }.position(x: geometry.size.width-geometry.size.width+20, y: geometry.size.height-60)
                        
                    }
                    
                }
            }
            
        }
    }
}




struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}


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
