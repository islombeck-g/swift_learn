//
//  enterView_02_00.swift
//  laborExchange
//
//  Created by Islombek Gofurov on 05.04.2023.


import SwiftUI


struct enterView_02_00: View {
    
    @State private var isMarkedFeMale = false
    @State private var isMarkedMale = true

    var addProgress: ()-> Void

    var body: some View {
        GeometryReader{geometry in
        VStack {
            Text("Личные данные")
                .frame(width: geometry.size.width-20)
                .font(.system(size: 28))
                .multilineTextAlignment(.center)
                .padding(.top)
            
            HStack {
                Text("Роль*")
                    .font(.system(size: 15))
                    .position(x:50)
                    .frame(width: geometry.size.width-20, height: 20)
                    
            }
            
            HStack {
                Button(action: {
                    if isMarkedFeMale {
                        withAnimation {
                            isMarkedFeMale = false
                            isMarkedMale = true
                        }
                    }
                }) {
                    Group {
                        Image(systemName: self.isMarkedMale ? "largecircle.fill.circle" : "circle")
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        Text("Студент")
                    }
                    .foregroundColor(.black)
                }
                
                Button(action: {
                    if isMarkedMale {
                        withAnimation {
                            isMarkedMale = false
                            isMarkedFeMale = true
                        }
                    }
                }) {
                    Group {
                        Image(systemName: self.isMarkedFeMale ? "largecircle.fill.circle" : "circle")
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        Text("Организация")
                    }
                    .foregroundColor(.black)
                }
            }
            
            
            Text("*Обязательное поле")
                .position(x:110)
                .frame(width: geometry.size.width-20, height: 20)
                .padding(.top, 15)
                .foregroundColor(.gray)
            
            Button(action: {
                withAnimation {
                    addProgress()
                }
            }) {
                Text("Далее")
                    .frame(width: geometry.size.width-50, height: 46)
                    .background(Color.black)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
//            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .background(.white, in: RoundedRectangle(cornerRadius: 25, style: .continuous))
        
    }
    }
}

//struct enterView_02_00_Previews: PreviewProvider {
//    static var previews: some View {
//        enterView_02_00(addProgress: <#() -> Void#>)
//    }
//}
