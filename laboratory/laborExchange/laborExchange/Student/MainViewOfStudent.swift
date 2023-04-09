
import SwiftUI

//struct Dane:Decodable{
//    var country:String
//    var url:String
//}
//

struct MainViewOfStudent: View {
    var body: some View {
        VStack{
            
            Text("StudentMain")
            
                
        }
    }
    
//    func loadData() {
//            guard let url = URL(string: "http://143.47.237.139/maincountrynone-znhs/") else { return }
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data else { return }
//                do {
//                    let dane = try JSONDecoder().decode(Dane.self, from: data)
//                    DispatchQueue.main.async {
//                         self.dane = dane
//                        self.link = dane.url
//                        print(dane.country)
//                        print(dane.url)
//                    }
//                } catch let error {
//                    print(error)
//                }
//            }.resume()
//        }
    
}

struct MainViewOfStudent_Previews: PreviewProvider {
    static var previews: some View {
        MainViewOfStudent()
    }
}
