//
//  NewItemView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewModel = NewItemViewModel()
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            
            Form {
                //Title
                TextField("Title", text: $newItemViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due data
                DatePicker("Due Date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save",
                         backgroundColor: .teal,
                         foregroundColor: .white) {
                    
                }
                         .padding()
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
