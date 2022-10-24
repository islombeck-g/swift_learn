//
//  TaskFilter.swift
//  toDoList
//
//  Created by Islombek Gofurov on 21.10.2022.
//

import SwiftUI

enum TaskFilter: String
{
    static var allFilters: [TaskFilter]
    {
        return [.NonCompleted, .Completed, .overdue, .All]
    }
    
    case All = "All"
    case NonCompleted = "To Do"
    case Completed = "Completed"
    case overdue = "Overdue"
    
}
