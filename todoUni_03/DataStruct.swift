//
//  DataStruct.swift
//  todoUni_03
//
//  Created by Islombek Gofurov on 28.01.2023.
//

import Foundation

struct TodoItem: Identifiable, Decodable, Encodable {
    var id =  UUID()
    var name: String
    var desc: String
    var sheduleDate: Date
    var priority: String
    var categoryName: String
    var categoryImg: String

}
