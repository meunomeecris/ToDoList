//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
