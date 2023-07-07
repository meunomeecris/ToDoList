//
//  MainView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct MainView: View {
    //Check if user is loged
    @StateObject var modelViewModel = MainViewModel()
    
    var body: some View {
        if modelViewModel.isSignedIn, !modelViewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    
    //Abstract View
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: modelViewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.teal)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
