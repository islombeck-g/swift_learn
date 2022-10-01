//
//  ContentView.swift
//  calc
//
//  Created by Islombek Gofurov on 01.10.2022.
//

import SwiftUI


struct ContentView: View {
    let grid = [
        ["AC","⌦","%","/"],
        ["7","8","9","*"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0","",".","="],
    ]
    
    var body: some View {
        VStack
        {
            HStack
            {
                Spacer()//выравнивание по правой стороне
                Text("something not interesting one")
                    .padding()//границы экрана
                    .foregroundColor(Color.white)
                    .font(.system(size:30, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack
            {
                Spacer()//выравнивание по правой стороне
                Text("something not interesting two")
                    .padding()//границы экрана
                    .foregroundColor(Color.white)
                    .font(.system(size:30, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id:\.self)
            {
                row in
                ForEach(row, id: \.self)
                {
                    cell in
                    Button {
                    action:do {buttonPressed(cell: cell)}
                    } label: {
                        Text(cell)
                    }
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
    func buttonPressed(cell:String)
    {
        
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
