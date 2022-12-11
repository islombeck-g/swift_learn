

import SwiftUI

struct ContentView: View {
    
    @State private var results = [ApiGet]()
    
    var body: some View {
        NavigationView{
            Form {
                List(results, id: \.id) { item in
                    Group{
                        ZStack{
                            Text("login")
                                .offset(x:-40)
                            Text(item.login)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("id")
                                .offset(x:-44)
                            Text(String(item.id))
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("type")
                                .offset(x:-10)
                            Text(item.type)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("url")
                                .offset(x:-110)
                            Text(item.url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                    }
                }
            }.onAppear(perform: loadData)
        }
    }


func loadData() {
    guard let url = URL(string: "https://api.github.com/users/islombeck-g") else {
        print("Your API end point is Invalid")
        return
    }
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(ApiGet.self, from: data) {
                DispatchQueue.main.async {
                    self.results.append(response)
                }
                return
            }
        }
    }.resume()
}

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
