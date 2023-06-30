//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            HStack{
                TextField("Add To Do", text: $text)
                    .font(.title)
                Image(systemName: "plus.app.fill")
                    .font(Font.system(size: 50))
                    .foregroundColor(.blue)
                    .navigationTitle("To do List")
            }
            .padding(.leading)
            .padding(.trailing)
            .frame(width: .infinity, height: 100)
            .background(Color.gray.opacity(0.2))
        }

    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
