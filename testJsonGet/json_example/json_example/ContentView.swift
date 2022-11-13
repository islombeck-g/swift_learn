//
//  ContentView.swift
//  json_example
//
//  Created by Islombek Gofurov on 08.11.2022.
//

import SwiftUI

struct Post: Identifiable, Codable
{
    var id = UUID()
    let title: String
    let body: String
}



class Api: ObservableObject
{
    func getPost(completion:@escaping ([Post])->()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {return}
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data!)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch {
                print("---", error)
            }
            
        }
        .resume()
    }
}
struct ContentView: View {
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView
        {
         List(posts)
            {post in
                VStack{
                    Text(post.title)
                        .fontWeight(.bold)
                    Text(post.body)
                }
            }
            .onAppear(){
                Api().getPost{(posts) in
                    self.posts=posts
                }
            }.navigationBarTitle("posts")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
