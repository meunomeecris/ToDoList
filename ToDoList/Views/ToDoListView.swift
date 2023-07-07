//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var toDoViewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    
    //Inicialiar a página com os dados do usuário
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/toDos")
        self._toDoViewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button(action: {
                                toDoViewModel.delete(id: item.id)
                            }) {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    toDoViewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $toDoViewModel.showingNewItemView) {
                NewItemView(newItemPresented: $toDoViewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "NJS7xXfrJmXe4vHy8MFkul5lKns1")
    }
}
