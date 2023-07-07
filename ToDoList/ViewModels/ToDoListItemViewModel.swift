//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

//ViewModel for "single" Item
class ToDoListItemViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItemModel) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        //update in datebase
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let database = Firestore.firestore()
        database.collection("users")
            .document(uid)
            .collection("toDos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
