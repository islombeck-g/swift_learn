import SwiftUI

//struct TodoItem: Identifiable,  {
//    var id =  UUID()
//    var name: String
//    var dateOfCreation: Date
//}

struct TodoItem: Identifiable, Decodable, Encodable {
    var id =  UUID()
    var name: String
    var dateOfCreation: Date
}

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


struct ContentView: View {
    @ObservedObject var todoList = TodoList()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoList.items) { item in
                    Text(item.name)
                }
                
                .onDelete { offsets in
                    todoList.remove(at: offsets)
                }
            }
            .navigationBarTitle("Todo List")
            .navigationBarItems(trailing:
                                    Button(action: {
                let newItem = TodoItem(name: "New Item", dateOfCreation: Date())
                todoList.add(item: newItem)
            }) {
                Image(systemName: "plus")
            }
            )
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








//
//В данном примере, создается структура ContentView, которая содержит NavigationView с заголовком "Todo List" и кнопкой добавления новой задачи. Внутри навигационного вида отображается список задач, который автоматически обновляется при изменении массива items в TodoList. Кроме того, добавлена функция для удаления задач из списка.
//
//Таким образом, вы сможете создать простой todo list с возможностью добавления, удаления и сохранения задач в UserDefaults в вашем приложении на SwiftUI.

