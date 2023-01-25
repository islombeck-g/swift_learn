
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks:FetchedResults<Task>
    @State var wichView:Int = 0
    @State private var showEditView = false
    @ObservedObject var me = ExampleCoreData()
    var body: some View {
        
        VStack {
            ChangeView{
                VStack{
                    if wichView == 0{
                        List{
                            VStack{
                                Text(me.name ?? "someOne")
                                Text(me.desc ?? "someDesc")
                            }  
                        }
                    }else if wichView == 1{
                        CalendarView()
                    }else if wichView == 2{
                        FocuseView()
                    }else {
                        ProfileView()
                    }
                }
            }
            Spacer()
            VStack{
                TapBarView(wichView: $wichView, showEditView: $showEditView)
                
            }
            
        }
        .sheet(isPresented: $showEditView){
            AddNewTaskView()
        }
        
        
    }
    func deleteTask (at offsets: IndexSet) {
        for offset in offsets {
            let t = tasks[offset]
            moc.delete(t)
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//                    Button("add"){
//                        let taskName = ["read", "write", "do"]
//                        let taskDesk = ["book", "exersices"]
//
//                        let choseTaskName = taskName.randomElement()
//                        let choseTaskDesc = taskDesk.randomElement()
//
//                        let task = Task(context: moc)
//                        task.id = UUID()
//                        task.name = ("\(String(describing: choseTaskName))")
//                        task.desc = ("\(String(describing: choseTaskDesc))")
//
//                        try? moc.save()
//                    }

//
//List{
//    ForEach(tasks){ task in
//        VStack{
//            Text(task.name ?? "someOne")
//            Text(task.desc ?? "someDesc")
//        }
//    }.onDelete(perform: deleteTask)
//}
