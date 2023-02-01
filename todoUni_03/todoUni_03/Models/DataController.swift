
import CoreData
import Foundation


class DataController:ObservableObject{
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores{ (description, error) in
            if let error = error{
                fatalError("CoreDATA Store FAiled \(error.localizedDescription)")
            }
            
        }
    }
    
    func saveData(taskName:String, taskDesc:String, taskDate:Date, selectedPriority:String, selectedCategory:String, selectedCategoryImg: String){
        let task = Task(context: container.viewContext)
        task.id = UUID()
        task.name = taskName
        task.desc = taskDesc
        task.sheduleDate = taskDate
        task.priority = selectedPriority
        task.categoryName = selectedCategory
        task.categoryImg = selectedCategoryImg
        task.doneOrNot = false
        
        do{
            try container.viewContext.save()
        }catch{
         print("failedToSaveData \(error)")
        }
    }
    func getAllData()->[Task]{
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do{
           return try container.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
        
    }
    func doneOrNor(task:Task)->Bool{
        return task.doneOrNot
    }
    func changeDoneOrNot(task:Task){
        task.doneOrNot.toggle()
        print("some majic")
        do{
            try container.viewContext.save()
        }catch{
         print("failedToSaveData \(error)")
        }
    }
    
}
