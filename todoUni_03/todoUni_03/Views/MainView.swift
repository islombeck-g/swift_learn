
import SwiftUI

struct MainView: View {
    
    @StateObject var data = DataController()
    @State private var showAddView = false
    @State private var showFocuseView =  false
    @State private var showTaskInfoView = false
    @EnvironmentObject var focuseModel: FocuseModel
    var body: some View {
        NavigationView{
            VStack {
                if showAddView{
                    AddTaskView(data: DataController(), showAddView: $showAddView)
                }else if showFocuseView{
                    FocuseView(showFocuseView: $showFocuseView)
                        .environmentObject(focuseModel)
                }
                else{
                    VStack{
                        Text("Reminders")
                            .foregroundColor(Color("light"))
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.leading, -150)
                            .padding(.top, 40)
                        List{
                            
                            Section(
                                header: Text("Today")
                                    .foregroundColor(Color("dark"))
                            ){
                                ForEach($data.tasks, id: \.self){ task in
                                    //Text(task.name ?? "errorName")
                                    NavigationLink(destination:TaskAllinformation(item: task, data: data)
                                    ){
                                        TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                    }
                                }
                            }
                        }
                        .id(UUID())
                        .listStyle(.plain)
                        .listRowBackground(Color.red)
                    }
                    ZStack{
                        TabBarMain(showAddView: $showAddView, showFocuseView: $showFocuseView)
                    }
                    .padding(.bottom, 45)
                }
            }
            .ignoresSafeArea()
            .padding(.top)
        }
        
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: DataController())
    }
}






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
