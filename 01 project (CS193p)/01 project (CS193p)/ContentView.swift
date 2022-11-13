//
//  ContentView.swift
//  01 project (CS193p)
//
//  Created by Islombek Gofurov on 11.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .padding(.horizontal)
                .foregroundColor(.red)
            Text("someShit")
                .foregroundColor(.orange)
            
        }
       
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
