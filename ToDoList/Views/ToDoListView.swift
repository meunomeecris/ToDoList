//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var toDoViewModel = ToDoListViewModel()
    private let userId: String
    
    //Inicialiar a página com os dados do usuário
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Hi there!")
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    toDoViewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $toDoViewModel.showingNewItemView) {
                NewItemView()
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
