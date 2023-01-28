//
//  WelcomeView.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 28.01.2023.
//

import SwiftUI

struct WelcomeView: View {
    //@AppStorage("isOnBoarding") var isOnBoarding: Bool?
    var body: some View {
        VStack{
           Text("me")
            Button{
               // isOnBoarding = false
            }label: {
                Image(systemName: "plus")
            }
        }
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
