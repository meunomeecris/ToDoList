//
//  NewItemView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .padding(.top, 30)
                .font(.system(size: 28))
                .bold()
            
            Form {
                //Title
                TextField("Title", text: $newItemViewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due data
                DatePicker("Due Date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(
                    title: "Save",
                    backgroundColor: .teal,
                    foregroundColor: .white)
                {
                    if newItemViewModel.validateItem {
                        newItemViewModel.save()
                        newItemPresented = false
                    } else {
                        newItemViewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $newItemViewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
