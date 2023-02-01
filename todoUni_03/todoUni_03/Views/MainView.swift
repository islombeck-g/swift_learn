
import SwiftUI

struct MainView: View {
    
    let data: DataController
    @State private var tasks:[Task] = [Task]()
    @State private var showAddView = false
    @State private var showFocuseView =  false
    @State private var showTaskInfoView = false
    var body: some View {
        
        VStack {
            if showAddView{
                AddTaskView(data: DataController(), showAddView: $showAddView)
            }else if showFocuseView{
                FocuseView(showFocuseView: $showFocuseView)
            }else if showTaskInfoView{
                TaskAllinformation(showTaskInfoView: $showTaskInfoView)
            }
            else{
                //NavigationView{
                VStack{
                    Text("Reminders")
                        .foregroundColor(Color("light"))
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.leading, -150)
                        .padding(.top, 40)
                    ScrollView{
                        //                        Section(
                        //                            header:
                        //                                Text("today")
                        //                                .foregroundColor(Color("dark"))
                        //                        ){
                        //                            ForEach(todoList.items) { item in
                        //                                HStack{
                        //
                        //
                        //                                    TaskView(showTaskInfoView: $showTaskInfoView, item: item)
                        //                                    //Text(item.name)
                        //                                }
                        //                                .padding(.horizontal, 5.0)
                        //
                        //                            }
                        //
                        //                            .onDelete { offsets in
                        //                                todoList.remove(at: offsets)
                        //                            }
                        //
                        //                            .id(UUID())
                        //                            .listRowSeparator(.hidden)
                        //
                        //                        }
                        Section(
                            header: Text("tomorrow")
                                .foregroundColor(Color("dark"))
                        ){
                            
                            ForEach(tasks, id: \.self){ task in
                                //Text(task.name ?? "errorName")
                                HStack{
                                    Button{
                                        task.doneOrNot.toggle()
                                       // upgradeView()
                                        tasks = tasks.map {
                                                if $0 == task {
                                                    return task
                                                }
                                                return $0
                                            }
                                    }label: {
                                        if data.doneOrNor(task: task){
                                            Image(systemName: "checkmark")
                                        }else{
                                            Image(systemName: "circle")
                                        }
                                        
                                    }
                                    TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                }
                                
                            }
                            
                        }
                    }
                    
                    .listStyle(.plain)
                    .listRowBackground(Color.red)
                    .refreshable{
                        //
                    }
                }.onAppear(perform: {
                    upgradeView()
                })
                
                
                
                ZStack{
                    TabBarMain(showAddView: $showAddView, showFocuseView: $showFocuseView)
                }.padding(.bottom, 45)
            }
        }
        .ignoresSafeArea()
        .padding(.top)
        
    }
    func upgradeView(){
        tasks = data.getAllData()
    }
}


struct TaskView: View {
    @Binding  var showTaskInfoView:Bool
    @State var item: Task
    @State var data: DataController
    var exampleDate:Date = .init()
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading){
                
                
                Text(item.name ?? "nameError")
                    .foregroundColor(Color("light"))
                    .font(.system(size:25))
                    .fontWeight(.black)
                
                    .strikethrough(item.doneOrNot, color: Color("light"))
                    .lineLimit(1)
                
                    .multilineTextAlignment(.leading)
                    .onTapGesture {
                        // Navigate to another view
                        self.showTaskInfoView = true
                    }
                if item.categoryName != ""{
                    HStack{
                        Image(systemName: "\(item.categoryImg ?? "graduationcap")")
                        Text(item.categoryName ?? "University")
                    }
                    //.padding(.leading)
                    .foregroundColor(Color("\(String(describing: self.item.priority))"))
                }
            }
            Spacer()
            VStack{
                Button{
                    
                    
                }label: {
                    Text(dateTostring())
                        .frame(width: 100, height: 50)
                        .border(Color("light"), width: 2)
                        .foregroundColor(Color("light"))
                    
                }
                // Text(item.sheduleDate, style: .date)
                
            }
            
            
        }.padding()
    }
    func dateTostring() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: item.sheduleDate ?? exampleDate)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: DataController())
    }
}


