//
//  LoginView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "ToDo List", subtitle: "Get things done!", angle: 8, backgroundColor: .green)
                
                //Login Form
                Form {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                    
                    Button {
                        //Attempt to login
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.black)
                                .frame(width: 300, height: 50)
                            
                            Text("Log In")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                        
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
