//
//  TaskView.swift
//  todoUni_03
//
//  Created by Islombek Gofurov on 30.01.2023.
//

import SwiftUI


struct TaskView: View {
    var item: TodoItem
    var body: some View {
        HStack{
            VStack{
                HStack{
                    VStack{
                        Text(item.name)
                            .foregroundColor(Color("light"))
                            .font(.system(size:25))
                            .fontWeight(.black)
                        if item.categoryName != ""{
                            HStack{
                                Image(systemName: "\(item.categoryImg)")
                                Text(item.categoryName)
                            }
                            //.padding(.leading)
                            .foregroundColor(Color("\(self.item.priority)"))
                        }
                    }
                    Spacer()
                    VStack{
                       // Text(item.sheduleDate, style: .date)
                        Text(item.sheduleDate, style: .time)
                            .frame(width: 100, height: 50)
                            .border(Color("light"), width: 2)
                            .foregroundColor(Color("light"))
                    }
                }
            }
        }
    }
}



//struct TaskView_Previews: PreviewProvider {
//        static var previews: some View {
//        TaskView()
//    }
//}


