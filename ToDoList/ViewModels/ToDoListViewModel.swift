//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete to do  list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(userId)
            .collection("toDos")
            .document(id)
            .delete()
    }
}
