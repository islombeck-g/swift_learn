
import SwiftUI


struct Dane:Decodable{
    var country:String
    var url:String
}
struct ContentView: View {
    @State var dane: Dane?
    @State public var link = ""
    
    var body: some View {
        
        VStack {
            
            
            
            NavigationView{
                
                if link.isEmpty{
                    VStack{
                        Image("icon")
                            .resizable()
                            .frame(width: 250, height: 250)
                        NavigationLink(destination: FortuneView()){
                            Text("Go to TwooView")
                        }
                    }
                    
                }
                else{
                    VStack{
                        Image("icon")
                            .resizable()
                            .frame(width: 250, height: 250)
                        NavigationLink(destination: WebView(sharedUrl: link)){
                            Text("Go to TwooView")
                        }
                    }
                    
                }
            }
            
            
            //            if dane != nil {
            //                NavigationLink(destination: WebView()) {
            //                    Text("Go to TwooView")
            //                }
            //
            //            } else {
            //                Text("Loading...")
            //            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "http://143.47.237.139/maincountrynone-znhs/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let dane = try JSONDecoder().decode(Dane.self, from: data)
                DispatchQueue.main.async {
                    self.dane = dane
                    self.link = dane.url
                    print(dane.country)
                    print(dane.url)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
