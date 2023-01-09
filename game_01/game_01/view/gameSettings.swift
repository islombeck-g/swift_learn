
import SwiftUI

struct gameSettings: View {
    
    @EnvironmentObject var s: GameSettings
    @State private var value = 0
    @State private var step = 1
    @State private var range = 0...50
    
    var body: some View {
        VStack{
            //количество ролей
            VStack{
                Text("Выберите количество ролей")
                    .bold()
                    .font(.system(size:20))
                HStack(){
                    Text("Всего игроков")
                        .font(.system(size:20))
                        .padding(.leading, 40.0)
                    Spacer()
                    Button{
                        s.minusCountAllPlayers()
                    } label:{
                        Image(systemName: "minus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                    Text(s.printPeople())
                    Button{
                        s.addCountAllPlayers()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                    
                }.padding()
                HStack{
                    Text("Мафия")
                        .font(.system(size:20))
                        .padding(.leading, 40.0)
                    Spacer()
                    Button{
                        s.minuscountOfMafia()
                    } label:{
                        Image(systemName: "minus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                    Text(s.printMafia())
                    Button{
                        s.addCountOfMafia()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                }
                .padding()
            }
            .padding(.top, 25.0)
            Spacer()
            //дополнительные роли
            VStack{
                Text("Выберите дополнительные роли")
                    .font(.system(size:20))
                    .bold()
                Button{
                    s.donMafiaInGame()
                    print(s.freePlaces)
                }label: {
                    if s.DonMafia{
                        HStack{
                            Image("hat")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            Text("Дон мафии")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 8))
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }
                    else{
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
                }
                Button{
                    s.maniacInGame()
                }label: {
                    if s.Maniac{
                        HStack{
                            Image("knife")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            Text("Маньяк")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 8))
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }else{
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
                }
                Button{
                    s.doctorInGame()
                }label: {
                    if s.Doctor{
                        HStack{
                            Image("doctor")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                            Text("Доктор")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 8))
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }
                    else{
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
                }
                Button{
                    s.journalistInGame()
                }label: {
                    if s.Journalist{
                        HStack{
                            Label("some", systemImage: "camera.fill")
                                .padding(.trailing, 10.0)
                                .labelStyle(IconOnlyLabelStyle())
                            Text("Журналист")
                                .padding(.trailing, 29.0)
                        }
                        .frame(maxWidth: 270, minHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 8))
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                    }
                    else{
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
            }
            Spacer()
            
            NavigationLink(destination: gamersNameChange())
            {
                Text("создать игру")
            }
            .padding(.vertical, 12.0)
            .padding(.horizontal, 45.0)
            .foregroundColor(Color("text_white_black"))
            .background(
                Color("button_black_white")
                    .cornerRadius(10))
        } .navigationTitle("настройте игру")
    }
}



struct gameSettings_Previews: PreviewProvider {
    static var previews: some View {
        gameSettings()
            .environmentObject(GameSettings())
    }
}
