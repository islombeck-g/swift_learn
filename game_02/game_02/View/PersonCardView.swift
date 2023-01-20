//
//  PersonCardView.swift
//  game_02
//
//  Created by Islombek Gofurov on 20.01.2023.
//

import SwiftUI

struct PersonCardView<Content>: View where Content:View {
    var content:()-> Content
    var body: some View {
        content()
    }
}

struct PersonCardFront:View{
    let someText: String
    var body: some View{
        VStack{
            Text(someText)
                .foregroundColor(Color("button_black_white"))
                .frame(width: 250, height: 400)
        }
        .frame(width: 250, height: 400)
        .background(Color.white)
        .shadow(radius: 15)
        
    }
}

struct PersonCardBack:View{
    let picture: String
    var body: some View{
        VStack{
                Image(picture)
                    .resizable()
                //.interpolation()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            
            
        }
        .frame(width: 250, height: 400)
        .background(Color.white)
        .shadow(radius: 15)
    }
}

struct PersonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCardView<PersonCardFront>(content: {PersonCardFront(someText:" ")})
    }
}
