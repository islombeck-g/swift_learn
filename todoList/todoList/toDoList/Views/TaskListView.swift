//
//  ContentView.swift
//  toDoList
//
//  Created by Islombek Gofurov on 16.10.2022.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder 

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)], 
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        NavigationView
        {
            VStack
            {
                ZStack
                {
                    List
                    {
                        ForEach(items)
                        { taskItem in
                            NavigationLink(destination: TaskEditViews(selectedTaskItem: taskItem, initialDate: Date())
                                .environmentObject(dateHolder))
                            {
                                TaskCell(passedTaskItem: taskItem)
                                    .environmentObject(dateHolder)
                            }
                        } 
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    FloatingButton()
                                .environmentObject(dateHolder)
                }
            }.navigationTitle("ToDoList")
            
        }
    }

     
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
