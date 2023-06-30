//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize.zero)
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 6))
            
            VStack {
                Text("TO DO LIST")
                    .bold()
                    .font(.system(size: 35))
                Text("Get things done")
                    .font(.system(size: 18))
            }
            .foregroundColor(.white)
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
