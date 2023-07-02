//
//  TLButton.swift
//  ToDoList
//
//  Created by Cris Messias on 02/07/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            //Action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(backgroundColor)
//                    .frame(width: 300, height: 30)
                
                Text(title)
                    .font(.system(size: 18))
                    .foregroundColor(foregroundColor)
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Button", backgroundColor: .black, foregroundColor: .white) {
            //action
        }
    }
}
