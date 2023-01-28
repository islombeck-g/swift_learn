//
//  DateController.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 23.01.2023.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "CoreData")
    init(){
        container.loadPersistentStores{ descriptoin, error in
            if let error = error{
                print("core data failed to load : \(error .localizedDescription)")
            }
        }
    }
}
