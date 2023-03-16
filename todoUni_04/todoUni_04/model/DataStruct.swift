//
//  DataStruct.swift
//  todoUni_04
//
//  Created by Islombek Gofurov on 11.03.2023.
//

import Foundation


struct DataStruct: Decodable, Identifiable {
    let id: Int
    let user_id: Int
    let taskName: String
    let creationDate: Date
    let priority: String
    let tags: String
    let tagsPic: String
    let notes: String
    
}
struct ArrayOfDataStruct:Decodable{
    var files: [DataStruct]
    
}
