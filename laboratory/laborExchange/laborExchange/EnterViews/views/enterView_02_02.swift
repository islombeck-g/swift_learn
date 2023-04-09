//
//  enterView_02_02.swift
//  laborExchange
//
//  Created by Islombek Gofurov on 08.04.2023.
//

import SwiftUI



struct enterView_02_02: View {
    var addProgress:()-> Void

    @State public var selectedOption: String
    @State public var selectedUnivercity: String
    
    @State public var phoneNumber: String
    
   
    let cities = [
      "Москва",
      "Санкт-Петербург",
      "Новосибирск",
      "Екатеринбург",
      "Нижний Новгород",
      "Казань",
      "Челябинск",
      "Омск",
      "Самара",
      "Ростов-на-Дону",
      "Уфа",
      "Красноярск",
      "Воронеж",
      "Пермь",
      "Волгоград",
      "Краснодар",
      "Саратов",
      "Тюмень",
      "Тольятти",
      "Ижевск",
      "Барнаул",
      "Иркутск",
      "Ульяновск",
      "Хабаровск",
      "Ярославль",
      "Владивосток",
      "Махачкала",
      "Томск",
      "Оренбург",
      "Кемерово"
    ]
    let universities = [
        "Казанский федеральный университет",
        "Московский государственный университет имени М.В. Ломоносова",
        "Санкт-Петербургский государственный университет",
        "Новосибирский государственный университет",
        "Московский институт физики и технологии",
        "Московский государственный технический университет имени Н.Э. Баумана",
        "Высшая школа экономики",
        "Томский государственный университет",
        "Национальный исследовательский ядерный университет «МИФИ»",
        "Казанский федеральный университет",
        "Университет ИТМО",
        "Московский государственный институт международных отношений",
        "Российский государственный гуманитарный университет",
        "Уральский федеральный университет",
        "Дальневосточный федеральный университет",
        "Национальный исследовательский технологический университет «МИСиС»",
        "Томский политехнический университет",
        "Сибирский федеральный университет",
        "Национальный исследовательский Томский государственный университет",
        "Национальный исследовательский университет «МЭИ»",
        "Российский государственный университет нефти и газа имени И.М. Губкина"
    ]
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Text("Личные данные")
                    .frame(width: geometry.size.width-20)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                
                Group{
                    Menu{
                        ForEach(cities, id: \.self){
                            city in
                            Button{
                                selectedOption = city
                            }label: {
                                Text(city)
                                    .foregroundColor(.orange)
                                    
                            }
                        }
                    }label: {
                        Text(selectedOption)
                            .frame(width: geometry.size.width-50, height: 46)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
                            
                        
                    }
                    Menu{
                        ForEach(universities, id: \.self){
                            city in
                            Button{
                                selectedUnivercity = city
                            }label: {
                                Text(city)
                                    .foregroundColor(.orange)
                                    
                            }
                        }
                    }label: {
                        Text(selectedUnivercity)
                            .frame(width: geometry.size.width-50, height: 46)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
                }
                
                        
                    
                }
                
                Group{
                    HStack{
                        Text("🇷🇺 +7")
                            .frame(width: 80, height: 46)
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(10)
                        TextField("Телефон*", text: $phoneNumber)
                        Spacer()
                    }
                    .frame(width: geometry.size.width-50, height: 46)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
                }
                
                
                
                
//
//                    .padding()
//                    .frame(width: geometry.size.width-50, height: 46)
//
//                    .padding(.horizontal)
                  
                
                
                Button{}label:{
                Text("Прикрепить аватар")
                    .frame(width: geometry.size.width-50, height: 46)
                    .background(Color.white)
                    .cornerRadius(13)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
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





//struct enterView_02_02_Previews: PreviewProvider {
//    static var previews: some View {
//        enterView_02_02()
//    }
//}
