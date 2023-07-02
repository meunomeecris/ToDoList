//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    //Creating an account
    func register() {
        guard validateRegister() else {
            return
        }
        
        //After ValidateRegister -> Create a User
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    //Put the data in a baseData
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let dataBase = Firestore.firestore()
        
        //Creating a colection to put all user
        dataBase.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    //Validating fields
    private func validateRegister() -> Bool {
        //reset the message
        errorMessage = ""
        
        //Cheking all fields is not empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields."
            return false
        }
        
        //Checking email charcters
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        //Checking size of the password
        guard password.count >= 6  else {
            errorMessage = "Passord must contains 6 chacacters"
            return false
        }
        
        return true
    }
    
}


//1h 20 
