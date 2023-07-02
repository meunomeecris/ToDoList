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
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
