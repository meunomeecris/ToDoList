//
//  User.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import Foundation


//Using Codable to convert in a Dictionary
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
