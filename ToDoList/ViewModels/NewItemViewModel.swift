//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard validatedItem else {
            return
        }
        
        //Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: dueDate.timeIntervalSince1970,
            isDone: false
        )
        
        //Save model in the datebase
        
        
        //Defining Database
        let database = Firestore.firestore()
        database.collection("users")
            .document(uID)
            .collection("toDos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var validatedItem: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
