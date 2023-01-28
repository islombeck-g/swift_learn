
import SwiftUI

struct MainView: View {
    @State private var showAddView = false
    var body: some View {
        NavigationView{
            
            VStack {
                if showAddView{
                    AddTaskView()
                }else{
                    Spacer()
                    TabBarMain(showAddView: $showAddView)
                    
                }
                
            }.ignoresSafeArea()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
