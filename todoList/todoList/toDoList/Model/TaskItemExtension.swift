//
//  TaskItemExtension.swift
//  toDoList
//
//  Created by Islombek Gofurov on 21.10.2022.
//

import SwiftUI

extension TaskItem
{
    func isCompleted() -> Bool
    {
     return completedDate != nil
    }
    
}
