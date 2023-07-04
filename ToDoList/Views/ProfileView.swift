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
                Text("It's me!")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
