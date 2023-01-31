
import SwiftUI

struct MainView: View {
    @ObservedObject var todoList = TodoList()
    @State private var showAddView = false
    @State private var showFocuseView =  false
    var body: some View {
        
        VStack {
            
            if showAddView{
                AddTaskView(showAddView: $showAddView)
            }else if showFocuseView{
                FocuseView(showFocuseView: $showFocuseView)
            }
            else{
                VStack{
                    Text("Reminders")
                        .foregroundColor(Color("light"))
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.leading, -150)
                        .padding(.top, 40)
                    ScrollView{
                        
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
                                .padding(.horizontal, 33.0)
                                
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
               
                
                ZStack{
                   TabBarMain(showAddView: $showAddView, showFocuseView: $showFocuseView)
                }.padding(.bottom, 45)
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


