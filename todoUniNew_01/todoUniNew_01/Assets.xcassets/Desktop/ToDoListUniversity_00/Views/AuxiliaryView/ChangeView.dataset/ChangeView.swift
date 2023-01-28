//
//  ChangeView.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 25.01.2023.
//

import SwiftUI

struct ChangeView<Content>: View where Content: View {
    var content:()->Content
    var body: some View {
        content()
    }
}

//struct CalendarView: View {
//    var body: some View {
//        VStack{
//            Text("CalendarView")
//            Image(systemName: "calendar")
//        }
//        .edgesIgnoringSafeArea(.all)
//        .background(Color.green)
//        
//    }
//}

//struct FocuseView: View {
//    var body: some View {
//        VStack{
//            Text("FocusView")
//            Image(systemName: "clock")
//        }
//
//    }
//}


//struct ChangeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
