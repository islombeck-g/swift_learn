import SwiftUI

struct MyStruct: Codable, Identifiable{
    var id: UUID = UUID()
    var name:String = ""
    var data:Date
}


struct ContentView: View {
    @State private var name: String = ""
    @State private var data: String = ""
    @AppStorage("some") var myStructs: [MyStruct] = []
    let decoder = PropertyListDecoder()
    init(){
        if let data = UserDefaults.standard.data(forKey: "myStructs"),
           let decoded = try? decoder.decode([MyStruct].self, from: data) {
            self.myStructs = decoded
        }
    }
    

    var body: some View {
        VStack {
            TextField("Enter name", text: $name)
            Button(action: {
                let newStruct = MyStruct(name: self.name, data: Date.now)
                self.myStructs.append(newStruct)
                let encoder = PropertyListEncoder()
                if let encoded = try? encoder.encode(self.myStructs) {
                    UserDefaults.standard.set(encoded, forKey: "myStructs")
                }
            }) {
                Text("Save")
            }
            List(myStructs) { myStruct in
                Text(myStruct.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
