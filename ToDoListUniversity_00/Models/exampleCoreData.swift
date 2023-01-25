
import Foundation

class ExampleCoreData: ObservableObject{
    @Published var name:String = "Do Homework"
    @Published var category: Int = 1
    @Published var creationDate: Date?
    @Published var desc: String = "math, ex 12, number 2"
    @Published var executionDate: Date?
    @Published var taskPriority:Int = 2
}
