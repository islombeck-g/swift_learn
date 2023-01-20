


import SwiftUI

struct GamersListView: View {
    @ObservedObject var s: GameSettingsViewModel
    @State public var people: [String] = []
    @State var showingWhoisWhoView = false
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .center){
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .onAppear{
                        self.addPeopleName()
                    }
                ForEach(people.indices, id:\.self){ tert in
                    TextField(
                        people[tert],
                        text: $people[tert]
                    )
                    .fixedSize()
                    .frame(maxWidth: 270, minHeight: 40)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .foregroundColor(Color("button_black_white"))
                    .disableAutocorrection(true)
                }
            }
            Spacer()
            
            
            Button(action: {
                self.showingWhoisWhoView.toggle()
                s.whoiswhoRand(name: self.people)
               // WhoIsWhoView(s:s)
            }) {
                Text("начать игру")
            }
            //        .sheet(isPresented: $showingWhoisWhoView) {
            //
            //            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 45.0)
            .foregroundColor(Color("text_white_black"))
            .background(Color("button_black_white")
            .cornerRadius(10))
            NavigationLink(destination: WhoIsWhoView(s:s), isActive: $showingWhoisWhoView) {
                EmptyView()
            }
        }
        
        
        
        
        
        
    }
    func addPeopleName(){
        for i in 0..<(s.countAllGamers()){
            people.append("Игрок \(i)")
        }
    }
    
    
}

struct GamersListView_Previews: PreviewProvider {
    static var previews: some View {
        GamersListView(s: GameSettingsViewModel())
    }
}





//
//import SwiftUI
//
//struct GamersListView: View {
//    @ObservedObject var s: GameSettingsViewModel
//    @State public var people: [String] = []
//
//    var body: some View {
//        VStack{
//            Spacer()
//            VStack(alignment: .center){
//
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                    .onAppear{
//                        self.addPeopleName()
//                    }
//                ForEach(people.indices, id:\.self){ tert in
//                    TextField(
//                        people[tert],
//                        text: $people[tert]
//                    )
//                    .fixedSize()
//                    .frame(maxWidth: 270, minHeight: 40)
//                    .background(Color.gray)
//                    .cornerRadius(10)
//                    .foregroundColor(Color("button_black_white"))
//                    .disableAutocorrection(true)
//                }
//            }
//            Spacer()
//            NavigationLink(destination: WhoIsWhoView(s:s), onActive: {
//                s.whoiswhoRand(name: people)
//                print("meeeeeee")
//            }) {
//                Text("начать игру")
//            }
//            .padding(.vertical, 12.0)
//                        .padding(.horizontal, 45.0)
//                        .foregroundColor(Color("text_white_black"))
//                        .background(
//                            Color("button_black_white")
//                                .cornerRadius(10))
//            Button(action: {
//                s.whoiswhoRand(name: people)
//                print("meeeeeee")
//            }) {
//                NavigationLink(destination: WhoIsWhoView(s:s)) {
//                    Text("начать игру")
//                }
//                .padding(.vertical, 12.0)
//                .padding(.horizontal, 45.0)
//                .foregroundColor(Color("text_white_black"))
//                .background(Color("button_black_white").cornerRadius(10))
//                .onTapGesture {
//                    print("meeeeeee")
//                }
//            }


//            Button{
//                s.whoiswhoRand(name: people)
//                print("meeeeeee")
//            }label:{
//                NavigationLink(destination: WhoIsWhoView(s:s)) {
//                    Text("начать игру")
//                }
//                .padding(.vertical, 12.0)
//                .padding(.horizontal, 45.0)
//                .foregroundColor(Color("text_white_black"))
//                .background(
//                    Color("button_black_white")
//                        .cornerRadius(10))
//            }

//        }.navigationTitle("Игроки")
//
//    }
//    func addPeopleName(){
//        for i in 0..<(s.countAllGamers()){
//            people.append("Игрок \(i)")
//        }
//    }
//
//
//}
//
//struct GamersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GamersListView(s: GameSettingsViewModel())
//    }
//}
