
import SwiftUI


struct AddNewTaskView: View {
    @ObservedObject var todoList = TodoList()
    
    @Binding var addTaskView: Bool
    @State var name:String = ""
    @State var desc:String = ""
    @State var category:String = "University"
    @State var creatioDate:Date?
    @State var taskPriority:Int = 5
    @State var executionDate:Date?
    @State private var scheduleTime = Date()
    @State private var scheduleDate = Date()
    
    @State var showPriorityView = false
    @State var showCategoryView = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                VStack{
                    Spacer()
                    TextField(
                        "Enter task name",
                        text: $name
                    )
                    .padding(13)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .padding(.horizontal, 15)
                    
                    TextField("Description", text: $desc)
                        .padding(13)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1.5)
                        )
                        .padding(.horizontal, 15)
                        .padding(.bottom, 50.0)
                    
                    HStack{
                        
                        Button{
                            //
                        }label: {
                            Image(systemName: "calendar")
                                .font(.title3)
                                .overlay{
                                    DatePicker(
                                        "",
                                        selection: $scheduleDate,
                                        displayedComponents: [.date]
                                    )
                                    .blendMode(.destinationOver)
                                }
                        }
                        Spacer().frame(width:20)
                        Button{
                        }label: {
                            Image(systemName: "clock")
                                .font(.title3)
                                .overlay{
                                    DatePicker(
                                        "",
                                        selection: $scheduleTime,
                                        displayedComponents: [.hourAndMinute]
                                    )
                                    .blendMode(.destinationOver)
                                }
                        }
                        Spacer().frame(width:20)
                        Button{
                            
                            if self.showPriorityView == true{
                                self.showPriorityView.toggle()
                            }
                            
                            showCategoryView.toggle()
                        }label: {
                            Image(systemName: "bookmark")
                        }
                        Spacer().frame(width:20)
                        Button{
                            if self.showCategoryView == true{
                                self.showCategoryView.toggle()
                            }
                            self.showPriorityView.toggle()
                        }label: {
                            Image(systemName: "flag")
                        }
                        Spacer().frame(width: 160)
                        Button{
                            if (name != "" && desc != ""){
                                let newItem = TodoItem(name: self.name, dateOfCreation: Date())
                                todoList.add(item: newItem)
                            }
                            if showCategoryView == true{self.showCategoryView.toggle()}
                            if showPriorityView == true{self.showPriorityView.toggle()}
                            self.addTaskView.toggle()
                        }label: {
                            Image(systemName: "chevron.right.circle")
                        }
                    }.foregroundColor(Color.white)
                        .padding(.bottom, 25)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 235)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }.padding(.bottom, -34)
            
            PriorityView(selectedNumber: $taskPriority, showPriorityView: $showPriorityView)
                .offset(y: showPriorityView ? 0 : 800)
                .animation(.spring())
            CategoryView(selectedNumber: $category, showCategoryView: $showCategoryView)
                . offset(y: showCategoryView ? 0 : 800)
                .animation(.spring())
            
        }
        
        
    }
}




//struct DateView:View{
//    @State private var birthdate = Date()
//    var body:some View{
//        DatePicker("Time", selection:$birthdate, in Date()...)
//    }
//}

//
//struct AddNewTask_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewTaskView()
//    }
//}
//




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
//Image(systemName: "calendar")
//    .font(.title3)
//    .overlay{ //MARK: Place the DatePicker in the overlay extension
//        DatePicker(
//            "",
//            selection: $scheduleTime,
//            displayedComponents: [.date]
//        )
//        .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
//        //                            .onChange(of: birthday, perform: { value in
//        //                                isChild = checkAge(date:birthday)
//        //                            })
//    }
