//
//  ContentView.swift
//  jsonApiTest
//
//  Created by Islombek Gofurov on 04.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [ApiGet]()
  
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.login)
            }
        }.onAppear(perform: loadData)
    }
    
  
    func loadData() {
        guard let url = URL(string: "https://api.github.com/users/islombeck-g") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([ApiGet].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
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
