//
//  ProfileView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user =  profileViewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            profileViewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray.opacity(0.35))
            .frame(width: 125, height: 125)
            .padding(.bottom, 50)
            .padding(.top, 50)
        
        //Infos
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                    .bold()
                    .foregroundColor(.gray.opacity(0.5))
                Text(user.name)
                    .foregroundColor(.teal)
            }
            .padding(4)
            HStack{
                Text("E-mail:")
                    .bold()
                    .foregroundColor(.gray.opacity(0.55))
                Text(user.email)
                    .foregroundColor(.teal)
            }
            .padding(4)
            HStack{
                Text("Member since:")
                    .bold()
                    .foregroundColor(.gray.opacity(0.5))
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.teal)
            }
            .padding(4)
        }
        .font(Font.system(size: 20))
        Spacer()
        //Sign out
        TLButton(
            title: "Sing out",
            backgroundColor: .red,
            foregroundColor: .white,
            action: {
                profileViewModel.logOut()
            })
        .frame(width: 300, height: 40)
        .bold()
        .padding()
        .padding(.bottom, 50)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
