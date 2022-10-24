//
//  TaskEditViews.swift
//  toDoList
//
//  Created by Islombek Gofurov on 16.10.2022.
//

import SwiftUI

struct TaskEditViews: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var selectedTaskItem: TaskItem?
    @State var desc: String
    @State var name: String
    @State var dueDate: Date
    @State var schedulTime: Bool
    
    init(selectedTaskItem: TaskItem? , initialDate: Date)
    {
        if let taskItem = selectedTaskItem
        {
            _selectedTaskItem = State(initialValue: taskItem)
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            _dueDate = State(initialValue: taskItem.dueDate ?? initialDate)
            _schedulTime = State(initialValue: taskItem.schedulTime)
        }else
        {
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _schedulTime = State(initialValue: false)
            
        }
    }
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Task"))
            {
                TextField("Task name", text:$name)
                TextField("Desc", text:$desc)
            }
            Section(header: Text("Due date"))
            {
                Toggle("schedulTime", isOn:$schedulTime)
                DatePicker("Due date", selection: $dueDate, displayedComponents: displayComps())
            }
           
            if selectedTaskItem?.isCompleted() ?? false
            {
                Section(header: Text("Completed"))
                {
                    Text(selectedTaskItem?.completedDate?.formatted(date: .abbreviated, time: .shortened) ?? "")
                        .foregroundColor(.green)
                }
            }
            
            Section()
            {
                Button("save", action: saveAction)
                    .font(.headline )
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
        func displayComps() -> DatePickerComponents
        {
            
            return schedulTime ? [.hourAndMinute, .date] : [.date]
        }
        func saveAction()
        {
            withAnimation
            {
                if selectedTaskItem == nil
                {
                    selectedTaskItem = TaskItem(context: viewContext)
                }
                selectedTaskItem?.created = Date()
                selectedTaskItem?.name = name
                selectedTaskItem?.desc = desc
                selectedTaskItem?.dueDate = dueDate
                selectedTaskItem?.schedulTime = schedulTime
                
                dateHolder.saveContext(viewContext)
                self.presentationMode.wrappedValue.dismiss()
                
            }
            
        }
    }
    
    struct TaskEditViews_Previews: PreviewProvider {
        static var previews: some View {
            TaskEditViews(selectedTaskItem: TaskItem(), initialDate: Date())
        }
    }
