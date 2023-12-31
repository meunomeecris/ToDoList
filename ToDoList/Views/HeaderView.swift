//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cris Messias on 30/06/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize.zero)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .bold()
                    .font(.system(size: 35))
                Text(subtitle)
                    .font(.system(size: 18))
            }
            .foregroundColor(.white)
            .padding(.top, 150)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -180)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 8, backgroundColor: .green)
    }
}
