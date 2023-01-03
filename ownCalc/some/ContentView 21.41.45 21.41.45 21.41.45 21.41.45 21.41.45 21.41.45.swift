//
//  ContentView.swift
//  some
//
//  Created by Islombek Gofurov on 31.10.2022.
//

import SwiftUI


struct ContentView: View
{
    
    let grid = [
        ["AC","⌦","%","/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", " ", ",", "="],
    ]
    
    @State var one = false
    @State var firstNumber = 0
    @State var secondNumber = 0
    @State var visibleText = "visibleText"
    @State var lastAction = ""
    var body: some View {
        
        
        
        VStack
        {
            HStack
            {
                Spacer()
                Text(visibleText)
                    .offset(y: 40)
                    .offset(x: -10)
                    .font(.system(size: 45, weight: .heavy))
                    .padding(.bottom, 200)
                    .foregroundColor(Color(hex:"42B2AC"))
            }
            ForEach(grid, id:\.self)
            {
                row in
                HStack
                {
                    ForEach(row, id:\.self)
                    {
                        cell in
                        Button(action: { buttonPressed(cell: cell)}, label:
                                {
                            ZStack{
                                if (cell == "AC" || cell == "⌦" || cell == "%" || cell == "/" || cell == "*" || cell == "-" || cell == "+" || cell == "=")
                                {
                                    Circle()
                                        .padding(3)
                                        .foregroundColor(Color(hex: "930E49"))
                                }else
                                {
                                    Circle()
                                        .padding(3)
                                        .foregroundColor(Color(hex: "D31469"))
                                }
                                
                                
                                Text(cell)
                                    .foregroundColor(buttonColor(cell))
                                    .font(.system(size: 40, weight: .heavy))
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                            }
                            
                        })
                        
                    }
                }
                
            }
            
        }
        .offset(y:20)
        .background(Color(hex: "21413F"))
        
        
    }
    func buttonColor(_ cell: String)-> Color
    {
        if (cell == "AC")
        {
            let seriy = Color(hex: "42B2AC")
            return seriy
        }
        return Color(hex: "42B2AC")
    }
    
    func buttonPressed(cell: String)
    {
        switch cell
        {
        case "AC":
            visibleText = ""
            firstNumber = 0
            secondNumber = 0
        case "⌦":
            visibleText = String(visibleText.dropLast())
        case "+":
            firstNumber = Int(visibleText) ?? 0
            lastAction = "+"
            visibleText = ""
        case "-":
            firstNumber = Int(visibleText) ?? 0
            lastAction = "-"
            visibleText = ""
        case "*":
            firstNumber = Int(visibleText) ?? 0
            lastAction = "*"
            visibleText = ""
        case "/":
            firstNumber = Int(visibleText) ?? 0
            lastAction = "/"
            visibleText = ""
        case "%":
            firstNumber = Int(visibleText) ?? 0
            lastAction = "%"
            visibleText = ""
        case "=":
            //visibleResult = calculateResult(calculateString: String(visibleText))
            if firstNumber != 0
            {
                secondNumber = Int(visibleText) ?? 0
                if lastAction == "+"
                {
                    var variable = firstNumber+secondNumber
                    visibleText = String(variable)
                    firstNumber = variable
                    secondNumber = 0
                    
                }else if lastAction == "-"
                {
                    var variable = firstNumber-secondNumber
                    visibleText = String(variable)
                }else if lastAction == "*"
                {
                    var variable = firstNumber*secondNumber
                    visibleText = String(variable)
                }else if lastAction == "/"
                {
                    var variable = firstNumber/secondNumber
                    visibleText = String(variable)
                }else if lastAction == "%"
                {
                    var variable = firstNumber*secondNumber/100
                    visibleText = String(variable)
                }
            }
            break
        default:
            visibleText+=cell
        }
    }
    func calculateResult(calculateString: String) -> String
    {
        var serching_index = calculateString.firstIndex(of: "+")
        
        return "some"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

