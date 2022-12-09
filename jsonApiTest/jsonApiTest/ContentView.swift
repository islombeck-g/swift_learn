

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
                    Group{
                        ZStack{
                            Text("node_id")
                                .offset(x:-41)
                            Text(item.node_id)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("avatar_url")
                                .offset(x:-130)
                            Text(item.avatar_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        
                        ZStack{
                            Text("html_url")
                                .offset(x:-100)
                            Text(item.html_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("followers_url")
                                .offset(x:-115)
                            Text(item.followers_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("following_url")
                                .offset(x:-115)
                            Text(item.following_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("gists_url")
                                .offset(x:-130)
                            Text(item.gists_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("starred_url")
                                .offset(x:-120)
                            Text(item.starred_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("subscriptions_url")
                                .offset(x:-95)
                            Text(item.subscriptions_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("organizations_url")
                                .offset(x:-94)
                            Text(item.organizations_url)
                                .foregroundColor(Color.blue)
                                .offset(x:150)
                        }
                        ZStack{
                            Text("repos_url")
                                .offset(x:-123)
                            Text(item.repos_url)
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
