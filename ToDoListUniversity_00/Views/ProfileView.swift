//
//  ProfileView.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 24.01.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedDate = Date()
        @State private var showCalendar = false
    var body: some View {
        VStack() {
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            Divider().frame(height: 1)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
            Divider()
        }
        .padding(.vertical, 100)
//        VStack{
//            DatePicker("Time", selection:$birthdate, in Date()...)
//            Text("ProfileView")
//            Image(systemName: "person")
//        }
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
