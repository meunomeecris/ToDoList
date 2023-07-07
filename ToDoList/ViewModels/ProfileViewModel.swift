//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class ProfileViewModel: ObservableObject {
    @Published var user:  User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let dataabase = Firestore.firestore()
        dataabase.collection("users").document(userId).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
