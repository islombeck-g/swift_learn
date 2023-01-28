//
//  AddTaskView.swift
//  toDoUniNew_02
//
//  Created by Islombek Gofurov on 28.01.2023.
//

import SwiftUI


struct AddTaskView: View {
    @State private var taskName:String = ""
    @State private var taskDesc:String = ""
    @State private var taskDate:Date = .init()
  
    let elems = ["University", "Work", "Movie", "Music", "Health", "Home", "Sport", "Project"]
    let pictOfElems = ["graduationcap", "briefcase", "popcorn","music.note.list", "bolt.heart","house","dumbbell","folder"]
    @State private var selectedElement: String? = nil
    
    var body: some View {
        NavigationView{
            
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
                    Image(systemName: "flag.fill")
                        .font(.title)
                        .padding(.leading, 10)
                    Group{
                        VStack {
                            HStack {
                                ForEach(0..<3) { index in
                                    Button(action: {
                                        self.selectedElement = self.elements[index]
                                    }) {
                                        Text(self.elements[index])
                                            .frame(width: 100, height: 50)
                                            .background(self.selectedElement == self.elements[index] ? Color.green : Color.white)
                                            .foregroundColor(self.selectedElement == self.elements[index] ? Color.white : Color.black)
                                            .cornerRadius(10)
                                    }
                                }
                            }}
                        Group{
                            HStack {
                                ForEach(3..<6) { index in
                                    Button(action: {
                                        self.selectedElement = self.elements[index]
                                    }) {
                                        Text(self.elements[index])
                                            .frame(width: 100, height: 50)
                                            .background(self.selectedElement == self.elements[index] ? Color.green : Color.white)
                                            .foregroundColor(self.selectedElement == self.elements[index] ? Color.white : Color.black)
                                            .cornerRadius(10)
                                    }
                                }
                            }}
                        Group{
                            HStack {
                                ForEach(6..<8) { index in
                                    Button(action: {
                                        self.selectedElement = self.elements[index]
                                    }) {
                                        Text(self.elements[index])
                                            .frame(width: 100, height: 50)
                                            .background(self.selectedElement == self.elements[index] ? Color.green : Color.white)
                                            .foregroundColor(self.selectedElement == self.elements[index] ? Color.white : Color.black)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        
                    }}
                Group{
                    Text("Note")
                    TextField("EnterTaskDesc", text: $taskDesc)
                        .padding(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("light"), lineWidth: 1.5)
                        )
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.top, -325)
            .foregroundColor(Color("light"))
            
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
