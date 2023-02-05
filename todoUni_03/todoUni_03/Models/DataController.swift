
import CoreData
import Foundation


class DataController: ObservableObject{
    let container: NSPersistentContainer
    @Published var tasks:[Task] = [Task]()
    
    
    
    init(){
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores{ (description, error) in
            if let error = error{
                fatalError("CoreDATA Store FAiled \(error.localizedDescription)")
            }
            
        }
        fetchTasks()
    }
    
    func fetchTasks(){
        let t = NSFetchRequest<Task>(entityName: "Task")
        
        do{
            tasks = try container.viewContext.fetch(t)
            
        }catch let error{
            print("Error is here. \(error)")
        }
        
    }
    
    
    func addToData(taskName:String, taskDesc:String, taskDate:Date, selectedPriority:String, selectedCategory:String, selectedCategoryImg: String){
        let task = Task(context: container.viewContext)
        task.id = UUID()
        task.name = taskName
        task.desc = taskDesc
        task.sheduleDate = taskDate
        task.priority = selectedPriority
        task.categoryName = selectedCategory
        task.categoryImg = selectedCategoryImg
        task.doneOrNot = false
        saveData()
        
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchTasks()
        }catch{
            print("failedToSaveData \(error)")
        }
    }
    
    
    func deleteTaskItem(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let task = tasks[index]
        container.viewContext.delete(task)
        saveData()
    }
    
    func taskJustDone(item: Task){
        item.doneOrNot.toggle()
        saveData()
    }
    
    func returnDoneOrNot(item: Task)-> Bool{
        
        if item.doneOrNot{
            return true
        }else{
            return false
        }
    }
    
}
