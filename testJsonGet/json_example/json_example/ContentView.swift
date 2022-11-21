//
//  ContentView.swift
//  json_example
//
//  Created by Islombek Gofurov on 08.11.2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

public struct Result: Codable {
    
    var login: String?
    var id: Int?
    var node_id: String
    var avatar_url: URL
    var url: URL
    var html_url: URL
    var followers_url: URL
    var following_url: URL
    var gists_url:URL
    var starred_url:URL
    var subscriptions_url: URL
    var organizations_url: URL
    var repos_url: URL
    var events_url: URL
    var received_events_url: URL
    var type: String
    var site_admin: Bool
    var name: String
    var company: String
    var blog: String
    var location: String
    var email: String
    var hireable: String
    var bio: String
    var twitter_username: String
    var public_repos: Int
    var public_gists: Int
    var followers: Int
    var following: Int
    //var created_at: //"2022-02-15T13:01:58Z"
    //var updated_at: //"2022-11-09T16:04:08Z"
}




struct ContentView: View {
    @State private var results = [Result]()

    var body: some View {
        
        VStack(alignment: .leading) {
            Text($results.login ?? "errorWithLogin")
                .foregroundColor(Color.black)
        }
        
        
        
    }
//    List(results, id: \.id) { item in
//                VStack(alignment: .leading) {
//                    Text(item.login ?? "errorWithLogin")
//                        .foregroundColor(Color.black)
//                }
//            }
    
    
    
    
    func loadData() async {
        guard let url = URL(string: "https://api.github.com/users/islombeck-g")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
            
        } catch {
            print("Invalid data")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
