
import SwiftUI

struct MainView: View {
    @ObservedObject var todoList = TodoList()
    @State private var showAddView = false
    var body: some View {
        ZStack{
            Color(.white)
            VStack {
                if showAddView{
                    AddTaskView(showAddView: $showAddView)
                }else{
                    
                    List{
                        
                        ForEach(todoList.items) { item in
                            Text(item.name)
                        }
                        
                        .onDelete { offsets in
                            todoList.remove(at: offsets)
                        }
                        .id(UUID())
                        
                    }
                    .refreshable{
                        //
                    }
                    
                    
                    Spacer()
                    TabBarMain(showAddView: $showAddView)
                }
                
            }
            .padding(.top, 40)
            .ignoresSafeArea()
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


