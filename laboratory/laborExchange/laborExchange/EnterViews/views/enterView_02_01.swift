//
//  enterView_02_01.swift
//  laborExchange
//
//  Created by Islombek Gofurov on 07.04.2023.
//

import SwiftUI

struct enterView_02_01: View {
    @State private var isMarkedFeMale = false
    @State private var isMarkedMale = true
    
    @State  var lastName:String
    @State  var firstName:String
    @State  var patronimyc:String
    @State  var gender: Bool
    
    var addProgress: ()-> Void
    
    var body: some View {
        GeometryReader{geometry in
            VStack{
                
                Text("Личные данные")
                    .frame(width: geometry.size.width-20)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                
                Group{
                    TextField("Фамилия*", text: $lastName)
                        .padding()
                        .frame(width: geometry.size.width-50, height: 46)
                    
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                    
                    TextField("Имя*", text: $firstName)
                        .padding()
                        .frame(width: geometry.size.width-50, height: 46)
                    
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                    TextField("Отчество*", text: $patronimyc)
                        .padding()
                        .frame(width: geometry.size.width-50, height: 46)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                }
                .padding(.vertical, 5)
                HStack {
                    Text("Пол*")
                        .font(.system(size: 15))
                        .padding(.top, 30)
                        .position(x:40)
                        .frame(width: geometry.size.width-20, height: 20)
                    
                }
                
                HStack{
                    Button{
                        if !gender {
                            withAnimation {
                                gender = true
                            }
                        }
                    }label: {
                        Group{
                            Image(systemName: self.gender ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            Text("Мужской")
                        }          .foregroundColor(.black)
                    }
                    Button{
                        if gender{
                            withAnimation {
                                gender = false
                            }
                        }
                    }label: {
                        Group{
                            Image(systemName: self.gender == false ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            Text("Женский")
                        }          .foregroundColor(.black)
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
                .padding(.bottom, 20)
                
            }
            
            
            
            
            .background(.white, in: RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
        
    }
}



//
//struct enterView_02_01_Previews: PreviewProvider {
//    static var previews: some View {
//        enterView_02_01()
//    }
//}
