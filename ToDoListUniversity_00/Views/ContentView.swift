
import SwiftUI

struct ContentView: View {
    //    @Environment(\.managedObjectContext) var moc
    //    @FetchRequest(sortDescriptors: []) var tasks:FetchedResults<Task>
    @State var wichView:Int = 0
    @State private var addTaskView = false
    @ObservedObject var me = ExampleCoreData()
    var body: some View {
        ZStack{
            VStack {
                ChangeView{
                    VStack{
                        if wichView == 0{
                            List{
                                VStack{
                                    Text(me.name)
                                    Text(me.desc)
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
                    TapBarView(wichView: $wichView, addTaskView: $addTaskView)
                        .padding(.bottom, 0)
                    
                }
            }
            AddNewTaskView(addTaskView: $addTaskView)
                .offset(y: addTaskView ? 0: 600)
                .animation(.spring())
            
            
        }
    }
    
    
    
//    func deleteTask (at offsets: IndexSet) {
//        for offset in offsets {
//            let t = tasks[offset]
//            moc.delete(t)
//            try? moc.save()
//        }
//    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }




//
//List{
//    ForEach(tasks){ task in
//        VStack{
//            Text(task.name ?? "someOne")
//            Text(task.desc ?? "someDesc")
//        }
//    }.onDelete(perform: deleteTask)
//}
