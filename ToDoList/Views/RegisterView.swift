//
//  RegisterView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subtitle: "Start organizing ToDO's!", angle: -8, backgroundColor: .teal)
            
            Spacer()
            
            //Form
            Form{
                TextField("Full Name", text: $name)
                    .autocorrectionDisabled()
                TextField("Email Adress", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $password)
                
                TLButton(
                    title: "Create",
                    backgroundColor: .teal,
                    foregroundColor: .white
                ) {
                    //action
                }
                .padding()
            }
            .offset(y: -150)
        } //VStack
    } //body
} //view

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
