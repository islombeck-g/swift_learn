//
//  FloatingButton.swift
//  toDoList
//
//  Created by Islombek Gofurov on 16.10.2022.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var dateHolder: DateHolder
     
    var body: some View {
        Spacer()
        HStack
        {
            NavigationLink (destination: TaskEditViews(selectedTaskItem: nil, initialDate: Date()) .environmentObject(dateHolder))
            {
                Text("+ new Task")
                    .font(.headline)
                
            }
        }
        .padding(15)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(25)
        .padding(30)
        .shadow(radius: 9)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
