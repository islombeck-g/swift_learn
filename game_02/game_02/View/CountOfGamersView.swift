
import SwiftUI

struct CountOfGamersView: View {
    
    @ObservedObject var s = GameSettingsViewModel()
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
                        s.minusCountPlayers()
                    } label:{
                        Image(systemName: "minus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                    Text(s.printPeople())
                    Button{
                        s.addCountPlayers()
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
                        s.minusCountMafia()
                    } label:{
                        Image(systemName: "minus")
                            .foregroundColor(Color("button_black_white"))
                            .padding()
                    }
                    Text(s.printMafia())
                    Button{
                        s.addCountMafia()
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
                    s.donMafiaIngame()
                }label: {
                    if s.boolDonMafia(){
                        HStack{
                            Image("donMafia")
                                .resizable()
                                .position(x: -33, y:12)
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
                            Image("donMafia")
                                .resizable()
                                .position(x: -33, y:12)
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
                    if s.boolManiac(){
                        HStack{
                            Image("knife")
                                .resizable()
                                .position(x: -45, y:12)
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
                                .position(x: -45, y:12)
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
                    if s.boolDoctor(){
                        HStack{
                            Image("doc")
                                .resizable()
                                .position(x: -45, y:12)
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
                            Image("doc")
                                .resizable()
                                .position(x: -45, y:12)
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
                    print("journalist")
                }label: {
                    if s.boolJournalist(){
                        HStack{
                            Image("journalist")
                                .resizable()
                                .position(x: -30, y:12)
                                .frame(width: 25.0, height: 25.0)
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
                            Image("journalist")
                                .resizable()
                                .position(x: -30, y:12)
                                .frame(width: 25.0, height: 25.0)
                                
                                
                     
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
            
            NavigationLink(destination: GamersListView(s:s))
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

struct CountOfGamersView_Previews: PreviewProvider {
    static var previews: some View {
        CountOfGamersView()
    }
    
}
