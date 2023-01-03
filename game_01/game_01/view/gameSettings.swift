//
//  gameSettings.swift
//  game_01
//
//  Created by Islombek Gofurov on 03.01.2023.
//

import SwiftUI

struct gameSettings: View {
    
    @State private var doctor = false
    @State private var donMafia = false
    @State private var maniac = false
    @State private var journalist = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                //количество ролей
                VStack{
                    Text("Выберите количество ролей")
                        .bold()
                    HStack{
                        Text("Всего игроков")
                    }
                    HStack{
                        Text("Мафия")
                    }
                }
                .padding(.top, 0.0)
                Spacer()
                //дополнительные роли
                VStack{
                    Text("Выберите дополнительные роли")
                        .bold()
                    
                    Button{
                        doctor.toggle()
                    }label: {
                        HStack{
                            Image("hat")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            
                            Text("Дон мафии")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }
                    Button{
                        doctor.toggle()
                    }label: {
                        HStack{
                            Image("knife")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            Text("Маньяк")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }
                    Button{
                        doctor.toggle()
                    }label: {
                        HStack{
                            Image("doctor")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            Text("Доктор")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                        
                    }
                    
                    Button{
                        doctor.toggle()
                    }label: {
                        HStack{
                            Label("some", systemImage: "camera.fill")
                                .padding(.trailing, 10.0)
                                .labelStyle(IconOnlyLabelStyle())
                            
                            Text("Журналист")
                                .padding(.trailing, 29.0)
                            
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                        
                    }
                    
                }
                
                Spacer()
                NavigationLink(destination: startGame())
                {
                    Text("создать игру")
                }
                .padding(.vertical, 12.0)
                .padding(.horizontal, 45.0)
                
                .foregroundColor(Color("text_white_black"))
                .background(
                    Color("button_black_white")
                        .cornerRadius(10))
            }
        }
        .navigationTitle("настройте игру")
        
    }
}



struct gameSettings_Previews: PreviewProvider {
    static var previews: some View {
        gameSettings()
    }
}
