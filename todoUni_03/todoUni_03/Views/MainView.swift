
import SwiftUI

struct MainView: View {
    @ObservedObject var todoList = TodoList()
    @State private var showAddView = false
    var body: some View {
        
        VStack {
            
            if showAddView{
                AddTaskView(showAddView: $showAddView)
            }else{
                VStack{
                    Text("Reminders")
                        .foregroundColor(Color("light"))
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.leading, -150)
                        .padding(.top, 40)
                    List{
                        Section(
                            header:
                                Text("today")
                                .foregroundColor(Color("dark"))
                        ){
                            ForEach(todoList.items) { item in
                                HStack{
                                    Button{
                                        
                                    }label: {
                                        if item.doneOrNor{
                                            Image(systemName: "checkmark")
                                        }else{
                                            Image(systemName: "circle")
                                        }
                                        
                                    }
                                    
                                    TaskView(item: item)
                                    //Text(item.name)
                                }
                                
                            }
                            .onDelete { offsets in
                                todoList.remove(at: offsets)
                            }
                            .id(UUID())
                        }
//                        Section(
//                            header: Text("tomorrow")
//                                .foregroundColor(Color("dark"))
//                        ){
//                            ForEach(todoList.items){item in
//                                Text(item.name)
//                            }
//                        }
                    }
                    .listRowBackground(Color.red)
                    .refreshable{
                        //
                    }
                }
                Spacer()
                
                ZStack{
                    TabBarMain(showAddView: $showAddView)
                }
            }
        }
        .ignoresSafeArea()
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


