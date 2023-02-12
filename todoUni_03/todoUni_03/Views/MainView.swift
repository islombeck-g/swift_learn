
import SwiftUI
    

struct MainView: View {
    
    @StateObject var data = DataController()
    @State private var showAddView = false
    @State private var showFocuseView =  false
    @State private var showTaskInfoView = false
    @EnvironmentObject var focuseModel: FocuseModel
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    if showAddView{
                        AddTaskView(data: DataController(), showAddView: $showAddView)
                    }else if showFocuseView{
                        FocuseView(showFocuseView: $showFocuseView)
                            .environmentObject(focuseModel)
                    }
                    else{
                        
                        Text("Reminders")
                            .foregroundColor(Color("light"))
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.leading, -150)
                            .padding(.top, 40)
                        List{
                            
                            Section(
                                header: Text("Next 24 hours")
                                    .foregroundColor(Color("dark"))
                            ){
                                ForEach(data.tasks, id: \.self){ task in
                                    
                                    if data.getTaskDateOnly(task: task) && data.returnDoneOrNot(item: task) == false {
                                        NavigationLink(destination:TaskAllinformation(item: task, data: data)
                                        ){
                                            TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                        }
                                    }
                                }
                            }
                            Section(
                                header: Text("Other date")
                                    .foregroundColor(Color("dark"))
                            ){
                                ForEach(data.tasks, id: \.self){ task in
                                    
                                    if !data.getTaskDateOnly(task: task) && data.returnDoneOrNot(item: task) == false {
                                        NavigationLink(destination:TaskAllinformation(item: task, data: data)
                                        ){
                                            TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                        }
                                    }
                                }
                            }
                            
                            Section(
                                header: Text("have Done")
                                    .foregroundColor(Color("dark"))
                            ){
                                ForEach(data.tasks, id: \.self){ task in
                                    
                                    if data.returnDoneOrNot(item: task) == true {
                                        NavigationLink(destination:TaskAllinformation(item: task, data: data)
                                        ){
                                            TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                        }
                                    }
                                }
                                .onDelete(perform: DeleteItem)
                            }
                            
                            
                        }.id(UUID())
                            .listStyle(.plain)
                        
                        
                        
                        
                        //                    ZStack{
                        //                        TabBarMain(showAddView: $showAddView, showFocuseView: $showFocuseView)
                        //                    }
                            .padding(.bottom, 45)
                        
                    }
                    
                }
                if showAddView == false && showFocuseView == false{
                    Group{
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
                    .position(x:30, y: 700)
                    
                    
                    Group{
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
                    .position(x: 300, y:700)
                }
            }
        }
        .ignoresSafeArea()
        .padding(.top)
    }
    func DeleteItem(at offsets: IndexSet){
        data.deleteTaskItem(indexSet: offsets)
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: DataController())
    }
}



//




//HStack{
//    Button{
//        task.doneOrNot.toggle()
//        upgradeView()
//    }label: {
//        if data.doneOrNor(task: task){
//            Image(systemName: "checkmark")
//        }else{
//            Image(systemName: "circle")
//        }
//
//    }
//    .fontWeight(.black).padding()
//    .foregroundColor(Color("dark"))
