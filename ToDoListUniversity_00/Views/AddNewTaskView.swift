
import SwiftUI


struct AddNewTaskView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tasks:FetchedResults<Task>
    @Environment(\.dismiss) var dismiss
    @State private var taskNameEnter = ""
    @State private var descriptionEnter = ""
    @Binding var showEditView: Bool
    
    
    @State var name:String = ""
    @State var desc:String = ""
    @State var category:Int32?
    @State var creatioDate:Date?
    @State var taskPriority:Int = 5
    @State var executionDate:Date?
    
    
    @State private var scheduleTime = Date()
    @State var showPriorityView = false
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
                                .overlay{ //MARK: Place the DatePicker in the overlay extension
                                    DatePicker(
                                        "",
                                        selection: $scheduleTime,
                                        displayedComponents: [.date]
                                    )
                                    .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
                                    
                                }
                        }
                        Spacer().frame(width:20)
                        Button{
                            //
                        }label: {
                            
                            Image(systemName: "clock")
                                .font(.title3)
                                .overlay{ //MARK: Place the DatePicker in the overlay extension
                                    DatePicker(
                                        "",
                                        selection: $scheduleTime,
                                        displayedComponents: [.hourAndMinute]
                                    )
                                    .blendMode(.destinationOver) //MARK: use this extension to keep the clickable functionality
                                    
                                }
                        }
                        Spacer().frame(width:20)
                        Button{
                            
                        }label: {
                            Image(systemName: "bookmark")
                        }
                        Spacer().frame(width:20)
                        Button{
                            self.showPriorityView.toggle()
                        }label: {
                            Image(systemName: "flag")
                        }
                        Spacer().frame(width: 160)
                        Button{
                            dismiss()
                           showEditView.toggle()
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
            
            PriorityView(selectedNumber: $taskPriority)
                         .offset(y: showPriorityView ? 0 : 800)
                         .animation(.spring())
        }
        
        
    }
}
//

//    func checkAge(date: Date) -> Bool  {
//        let today = Date()
//        let diffs = Calendar.current.dateComponents([.year], from: date, to: today)
//        let formatter = DateComponentsFormatter()
//        let outputString = formatter.string(from: diffs)
//        self.ageFilter = outputString!.filter("0123456789.".contains)
//        let ageTest = Int(self.ageFilter) ?? 0
//        if ageTest > 18 {
//            return false
//        }else{
//            return true
//        }
//    }



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
