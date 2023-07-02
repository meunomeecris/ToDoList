//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = "" 
    
    init() {
        
    }
    
    func login() {
        guard validateLogin() else {
            return
        }
        
        //try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    private func validateLogin() -> Bool {
        //reset the message
        errorMessage = ""
        
        //Checking empties fields
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        //Validating the email field
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
