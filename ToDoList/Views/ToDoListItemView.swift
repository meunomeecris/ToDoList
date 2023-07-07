//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var toDolistItemViewModel = ToDoListItemViewModel()
    let item: ToDoListItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(Font.system(size: 20))
                    .foregroundColor(.teal)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                toDolistItemViewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.teal)
                    .font(Font.system(size: 24))
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
             id: "123",
             title: "Buy Tofu",
             dueDate: Date().timeIntervalSince1970,
             createdDate: Date().timeIntervalSince1970,
             isDone: false
        ))
    }
}
