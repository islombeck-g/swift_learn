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
    let operators = ["/","+","%","*"]
    @State var visibleWorkings=""
    @State var visibleResults=""
    var body: some View {
        VStack
        {
            HStack
            {
                Spacer()//выравнивание по правой стороне
                Text(visibleWorkings)
                    .padding()//границы экрана
                    .foregroundColor(Color.white)
                    .font(.system(size:30, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack
            {
                Spacer()//выравнивание по правой стороне
                Text(visibleResults)
                    .padding()//границы экрана
                    .foregroundColor(Color.white)
                    .font(.system(size:30, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id:\.self)
            {
                row in
                HStack{
                    ForEach(row, id: \.self)
                    {
                        cell in
                        Button { action:do {buttonPressed(cell: cell)}
                        } label: {
                            Text(cell)
                                .foregroundColor(buttonColor(cell))
                                .font(.system(size: 40, weight: .heavy))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }}
                
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
    
    func buttonColor(_ cell:String)->Color
    {
        if(cell=="AC"||cell=="⌦")
        {return .red}
        if (cell=="-"||cell=="=" || operators.contains(cell) )
        {return .orange}
        return .white
    }
    func buttonPressed(cell:String)
    {
        switch cell {
        case "AC":
            visibleWorkings=""
            visibleResults=""
        case "⌦":
            visibleWorkings=String(visibleWorkings.dropLast())
        case "=":
            visibleResults=calculateResult()
        default:
            visibleWorkings+=cell
        }
        
        
        
    }
    func calculateResult()->String
    {
        var workings=visibleWorkings.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
        return ""
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
