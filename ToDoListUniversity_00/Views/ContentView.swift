
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks:FetchedResults<Task>
    @State private var wichView:Int = 0
    @State private var showEditView = false
    var body: some View {
        
        VStack {
            List{
                ForEach(tasks){ task in
                    VStack{
                        Text(task.name ?? "someOne")
                        Text(task.desc ?? "someDesc")
                        
                    }
                    
                }.onDelete(perform: deleteTask)
            }
            
            VStack{
                ZStack{
                    
                    HStack{
                        Button{
                            wichView = 0
                        }label: {
                            VStack{
                                if wichView == 0{
                                    Image(systemName: "house.fill")
                                }else{
                                    Image(systemName: "house")
                                }
                                Text("Home")
                                    .font(.system(size: 8))
                            }
                            
                        }
                        Spacer().frame(width:50)
                        Button{
                            wichView = 1
                        }label: {
                            VStack{
                                if wichView == 1{
                                    Image(systemName: "calendar.badge.plus")
                                }else{
                                    Image(systemName: "calendar")
                                }
                                Text("Calendar")
                                    .font(.system(size:8))
                                    .lineLimit(1)
                                    .padding(.horizontal, -10.0)
                            }
                            
                        }
                        Spacer().frame(width: 120)
                        Button{
                            wichView = 2
                        }label: {
                            VStack{
                                if wichView == 2{
                                    Image(systemName: "clock.fill")
                                }else{
                                    Image(systemName: "clock")
                                }
                                Text("Focuse")
                                    .font(.system(size: 8))
                            }
                            
                        }
                        Spacer().frame(width: 50)
                        Button{
                            wichView = 3
                        }label: {
                            VStack{
                                if wichView == 3{
                                    Image(systemName: "person.fill")
                                }else{
                                    Image(systemName: "person")
                                }
                                Text("profile")
                                    .font(.system(size: 8))
                            }
                            
                        }
                    }
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.gray)
                   
                    Button{
                        self.showEditView.toggle()
                    }label: {
                           Image(systemName: "plus")
                            .padding()
                            .font(.system(size: 25))
                    }
                    .background(Color.purple)
                    .clipShape(Circle())
                    .offset(y: -20)

                }
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
