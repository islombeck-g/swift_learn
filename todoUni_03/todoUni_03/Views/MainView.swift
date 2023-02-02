
import SwiftUI

struct MainView: View {
    
    let data: DataController
    @State private var tasks:[Task] = [Task]()
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
                        ScrollView{
                            
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
                                            
                                        }label: {
                                            if data.doneOrNor(task: task){
                                                Image(systemName: "checkmark")
                                            }else{
                                                Image(systemName: "circle")
                                            }
                                            
                                        }
                                        .fontWeight(.black).padding()
                                        .foregroundColor(Color("dark"))
                                        TaskView(showTaskInfoView: $showTaskInfoView, item: task, data: data)
                                            .padding(.leading, -15)
                                    }
                                    
                                }
                                
                            }
                        }
                        
                        .listStyle(.plain)
                        .listRowBackground(Color.red)
                        //                    .refreshable{
                        //                        upgradeView()
                        //                    }
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
    }
    func upgradeView(){
        tasks = data.getAllData()
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: DataController())
    }
}


