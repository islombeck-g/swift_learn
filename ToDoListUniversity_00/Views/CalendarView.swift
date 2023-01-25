//
//  CalendarView.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 24.01.2023.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack{
            Text("CalendarView")
            Image(systemName: "calendar")
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.green)

    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
