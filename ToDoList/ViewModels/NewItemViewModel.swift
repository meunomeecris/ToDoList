//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        
    }
}
