//
//  DetailView.swift
//  game_02
//
//  Created by Islombek Gofurov on 14.01.2023.
//

import SwiftUI


enum ViewEnum {
    case view1, view2
}

struct DetailView: View {
    @State var currentView: ViewEnum = .view1
    
    var body: some View {
        VStack {
            if currentView == .view1 {
                View1()
            } else if currentView == .view2 {
                View2()
            }
            Button("Change View") {
                if self.currentView == .view1 {
                    self.currentView = .view2
                } else {
                    self.currentView = .view1
                }
            }
        }
    }
}

struct View1: View {
    var body: some View {
        Text("This is View 1")
    }
}

struct View2: View {
    var body: some View {
        Text("This is View 2")
    }
}
//struct DetailView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}




