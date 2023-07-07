//
//  ToDoListItemModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    //Check if the item List is done or not
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
