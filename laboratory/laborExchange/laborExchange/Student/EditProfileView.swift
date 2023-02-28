

import SwiftUI

struct EditProfileView: View {
    @State private var progressInt:Int = 1
    @State private var surname:String = ""
    @State private var username:String = ""
    @State private var patronymic:String = ""
    @State private var dateOfBirth:String = ""
    
    @State private var elipsisViewShowButton:Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                GeometryReader{ geometry in
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .frame(width: geometry.size.width-42, height: 6)
                                .padding(.top, 45)
                                .padding(.leading, 21.0)
                                .padding(.trailing, 21)
                            HStack{
                                Group{
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 1 ? .gray: . black)
                                        Text("1")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame( width: progressInt == 1 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 2 ? .gray: . black)
                                        Text("2")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame(width: progressInt == 2 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 3 ? .gray: . black)
                                        Text("3")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame(width: progressInt == 3 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    
                                    
                                }
                                Group{
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 4 ? .gray: . black)
                                        Text("4")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame(width: progressInt == 4 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 5 ? .gray: . black)
                                        Text("5")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame(width: progressInt == 5 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .foregroundColor(progressInt == 6 ? .gray: . black)
                                        Text("6")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12))
                                    }.frame(width: progressInt == 6 ? 21 : 16, height: progressInt == 1 ? 21 : 16)
                                    Spacer()
                                }
                                
                            }.padding(.top, 45)
                        }
                        
                        ZStack{
                            Circle()
                                .frame(width: 160, height: 160)
                                .foregroundColor(Color("noImageColor"))
                            
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [14], dashPhase: 0))
                                .foregroundColor(Color("strokeColor"))
                                .frame(width: 180, height: 180)
                        }.padding(.top, 25)
                        
                    }
                }.frame(height:334)
                GeometryReader{geometry in
                    Group{
                        Text("Фамилия")
                            .font(.system(size: 17))
                        
                        TextField("Surname", text: $surname)
                            .padding(.leading, 16)
                            .frame(width: geometry.size.width - 32, height: 46)
                            .background(Color("textFieldColor"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.top, 34)
                        
                    }
                    Group{
                        Text("Имя")
                            .font(.system(size: 17))
                            .padding(.top, 91)
                        TextField("Username", text: $username)
                            .padding(.leading, 16)
                            .frame(width: geometry.size.width - 32, height: 46)
                            .background(Color("textFieldColor"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.top, 122)
                    }
                    Group{
                        Text("Отчество")
                            .font(.system(size: 17))
                            .padding(.top, 179)
                        TextField("Paytronymic", text: $patronymic)
                            .padding(.leading, 16)
                            .frame(width: geometry.size.width - 32, height: 46)
                            .background(Color("textFieldColor"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.top, 210)
                    }
                    Group{
                        Text("Дата рождения")
                            .font(.system(size: 17))
                            .padding(.top, 267)
                        TextField("01.02.2003", text: $dateOfBirth)
                            .padding(.leading, 16)
                            .frame(width: geometry.size.width - 32, height: 46)
                            .background(Color("textFieldColor"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.top, 298)
                    }
                    Button{}label:{
                        Text("Сохранить")
                            .frame(width: geometry.size.width-10, height: 60, alignment: .center)
                            .background(Color.black)
                            .cornerRadius(13)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 370)
                }
                .padding(.leading, 16)
                .frame(height:410)
                Spacer()
            }
            .navigationTitle("редактирование профиля")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{}label:{
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        elipsisViewShowButton.toggle()
                    }label:{
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.black)
                        
                    }
                }
                
            }
            
        }
        
    }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}


//спросить у дизайнера
//нужны ли глаза справа от каждого textField?
