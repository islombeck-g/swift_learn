
import SwiftUI




struct AddTaskView: View {
    @Binding var showAddView: Bool
    
    
    @State private var taskName:String = ""
    @State private var taskDesc:String = ""
    @State private var taskDate:Date = .init()
    
    let elems = ["Project", "Work", "Movie", "Music", "Health", "Home", "Sport", "University"]
    let pictOfElems = ["folder", "briefcase", "popcorn","music.note.list", "bolt.heart","house","dumbbell","graduationcap"]
    @State private var selectedCategory: String? = nil
    @State private var selectedPriority: String? = nil
    @State private var selectedCategoryImg:String? = nil
    @ObservedObject var todoList = TodoList()
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading, spacing: 10.0){
                    
                    Text("New Task")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Group{
                        Text("Name")
                        
                        TextField("EnterTaskName", text: $taskName)
                            .padding(13)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("light"), lineWidth: 1.5)
                            )
                    }
                    Group{
                        Text("Remind me")
                        ZStack{
                            Image(systemName: "alarm.waves.left.and.right")
                                .padding(.leading, -165.0)
                                .font(.title)
                            
                            DatePicker("", selection: $taskDate, in:Date()...)
                        }
                    }
                    Group{
                        Text("Priority")
                        HStack{
                            Button{
                                self.selectedPriority = "green"
                            }label: {
                                Circle()
                                    .fill(.green)
                                    .frame(width: self.selectedPriority == "green" ? 30 : 25, height: self.selectedPriority == "green" ? 30 : 25, alignment: .center)
                            }
                            Button{
                                self.selectedPriority = "yellow"
                            }label: {
                                Circle()
                                    .fill(.yellow)
                                    .frame(width: self.selectedPriority == "yellow" ? 30 : 25, height: self.selectedPriority == "yellow" ? 30 : 25, alignment: .center)
                            }
                            Button{
                                self.selectedPriority = "orange"
                            }label: {
                                Circle()
                                    .fill(.orange)
                                    .frame(width: self.selectedPriority == "orange" ? 30 : 25, height: self.selectedPriority == "orange" ? 30 : 25, alignment: .center)
                            }
                            Button{
                                self.selectedPriority = "red"
                            }label: {
                                Circle()
                                    .fill(.red)
                                    .frame(width: self.selectedPriority == "red" ? 30 : 25, height: self.selectedPriority == "red" ? 30 : 25, alignment: .center)
                            }
                            
                        }
                    }
                    Group{
                        Text("Tags")
                        VStack{
                            HStack{
                                ForEach(0..<3) { index in
                                    
                                    Button{
                                        self.selectedCategory = self.elems[index]
                                    }label: {
                                        HStack{
                                            Image(systemName: pictOfElems[index])
                                            Text(self.elems[index])
                                        }
                                        .frame(width: 100, height: 50)
                                        .background(self.selectedCategory == self.elems[index] ? Color("light") : Color.white)
                                        .foregroundColor(self.selectedCategory == self.elems[index] ? Color.white : Color.gray)
                                        .cornerRadius(10)
                                        
                                    }
                                }
                            }
                            HStack{
                                ForEach(3..<6) { index in
                                    Button {
                                        self.selectedCategory = self.elems[index]
                                    }label: {
                                        HStack{
                                            Image(systemName: pictOfElems[index])
                                            Text(self.elems[index])
                                        }
                                        .frame(width: 100, height: 50)
                                        .background(self.selectedCategory == self.elems[index] ? Color("light") : Color.white)
                                        .foregroundColor(self.selectedCategory == self.elems[index] ? Color.white : Color.gray)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                            HStack {
                                ForEach(6..<8) { index in
                                    Button(action: {
                                        self.selectedCategory = self.elems[index]
                                    }) {
                                        HStack{
                                            Image(systemName: pictOfElems[index])
                                            Text(self.elems[index])
                                        }
                                        .frame(width: 125, height: 50)
                                        .background(self.selectedCategory == self.elems[index] ? Color("light") : Color.white)
                                        .foregroundColor(self.selectedCategory == self.elems[index] ? Color.white : Color.gray)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                    Text("Note")
                    TextField("EnterTaskDesc", text: $taskDesc)
                        .padding(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("light"), lineWidth: 1.5)
                        )
                    
                    
                }
                .padding(.horizontal, 30)
                .foregroundColor(Color("light"))
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        
                        if(taskName != "" && taskDesc != "" && selectedPriority != nil && selectedCategory != nil){
                            let newItem = TodoItem(
                                name: taskName,
                                desc: taskDesc,
                                sheduleDate: taskDate,
                                priority: selectedPriority ?? "green",
                                categoryName: selectedCategory ?? "University",
                                categoryImg: selectedCategoryImg ?? "graduationcap")
                                
                            todoList.add(item: newItem)
                        }
                        
                        self.showAddView.toggle()
                    }label:{
                        ZStack{
                            Rectangle()
                                .fill(Color("dark"))
                                .frame(width: 140, height: 60)
                                .modifier(RoundedCorner(corners: [.topLeft], radius: 20))
                            HStack{
                                Image(systemName: "plus")
                                Text("add")
                            }.foregroundColor(Color.white)
                                .font(.title2)
                            
                            
                        }
                        
                    }
                }.ignoresSafeArea()
                    .padding(.bottom, -34)
            }
        }
    }
}
//
//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView()
//    }
//}
//







