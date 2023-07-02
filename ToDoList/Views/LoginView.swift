//
//  LoginView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(
                    title: "ToDo List",
                    subtitle: "Get things done!",
                    angle: 8, backgroundColor: .green)
                
                //Login Form
                Form {
                    TextField("Email", text: $loginViewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $loginViewModel.password)
                    
                    TLButton(
                        title: "Log in",
                        backgroundColor: .green,
                        foregroundColor: .white)
                    {
                        //action
                    }
                }
                .offset(y: -50)
                
                //Create Account Link
                VStack {
                    Text("New around here?")
                        .padding(.bottom, 2)
                    NavigationLink("Create an account", destination: RegisterView())
                        .foregroundColor(Color.green)
                }
                .padding(.bottom, 40)
                
                Spacer()
            } //VStack
        } //navigation
    } //body
} //view

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
