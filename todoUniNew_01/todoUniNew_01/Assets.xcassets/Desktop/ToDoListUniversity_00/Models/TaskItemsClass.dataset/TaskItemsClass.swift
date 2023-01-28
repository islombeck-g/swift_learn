
import Foundation


class TodoList: ObservableObject {
    @Published var items = [TodoItem]()
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "todoItems"),
           let items = try? JSONDecoder().decode([TodoItem].self, from: data) {
            self.items = items
        }
    }
    
    func add(item: TodoItem) {
        items.append(item)
        save()
    }
    
    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: "todoItems")
        }
    }
}
