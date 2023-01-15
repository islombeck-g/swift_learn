//
//  WhoIsWhoView.swift
//  game_02
//
//  Created by Islombek Gofurov on 13.01.2023.
//

import SwiftUI



struct WhoIsWhoView: View {
    
    @ObservedObject var s: GameSettingsViewModel
    //let names = ["John", "Emily", "Michael", "Sarah", "Jessica"]
    
    @State public var currentIndex = 0
    
    var body: some View {
        VStack {
            Text("Current name: \($s.names.count)")
            Button(action: {
                self.currentIndex = self.currentIndex + 1
            }) {
                Text("Switch")
            }
        }
    }
}

//struct WhoIsWhoView: View {
//
//    @ObservedObject var s: GameSettingsViewModel
//    var body: some View {
//        VStack{
//
//            ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(1...10, id: \.self) { i in
//                                Text("image\(i)")
//                                    .frame(width: 300, height: 200)
//                                    .background(Color.red)
//                            }
//                        }
//                    }
//
//            VStack{
//                Image(systemName: "person.fill")
//                    .font(.system(size: 100, weight: .light))
//                    .frame(width: 300, height: 500)
//                    .foregroundColor(Color("button_black_white"))
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//            }
//            Text("me")
//        }
//    }
//
//}
struct WhoIsWhoView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsWhoView(s:GameSettingsViewModel())
    }
}
