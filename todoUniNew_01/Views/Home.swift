
import SwiftUI

struct Home: View {
    @State var selectedTap:Tabs = .home
    var body: some View {
        
        ZStack{
            Color(.white)
                .ignoresSafeArea() 
            VStack{
                VStack {
                    ScrollView{
                        if selectedTap == .home{
                            TasksView()
                        }else if selectedTap == .focuse{
                            FocuseView()
                        }else if selectedTap == .add{
                            AddTaskView()
                                .animation(.spring())
                        }
                        
                    }
                }
               
                TapBarMain(selectedTap: $selectedTap)
                    .padding(.bottom, -25)
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
