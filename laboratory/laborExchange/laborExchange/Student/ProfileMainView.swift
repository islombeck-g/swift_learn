
import SwiftUI

struct ProfileMainView: View {
    @State var showEditView = false
    
    var body: some View {
        NavigationView{
            VStack{
                Group{
                    HStack{
                        GeometryReader { geometry in
                            Image(systemName: "bell")
                                .foregroundColor(.black)
                                .position(x: 30, y: 20)
                            
                            Spacer()
                            Text("Профиль")
                                .position(x: geometry.size.width / 2, y: 20)
                            Spacer()
                            Menu{
                                
                                Button{
                                    showEditView.toggle()
                                }label:{
                                    Text("Редактировать профиль")
                                }
                                Button(role: .destructive){}label:{
                                    Text("Удалить аккаунт")
                                }
                            }label:{
                                Image(systemName: "ellipsis")
                                    .rotationEffect(Angle(degrees: 90))
                                    .frame(width: 20, height: 30)
                                    .foregroundColor(.black)
                                
                            }.position(x: geometry.size.width - 30, y: 20)
                            //                            Image(systemName: "ellipsis")
                            //                                .rotationEffect(Angle(degrees: 90))
                            //                                .foregroundColor(.black)
                            //                                .frame(width: 10, height: 30)
                            //                                .contextMenu{
                            //
                            //                                    NavigationLink(destination: EditProfileView()){
                            //                                        Text("Редактировать профиль")
                            //                                    }
                            //                                    Button {
                            //                                        print("deleteAccountButton")
                            //                                    } label: {
                            //                                        Text("Удалить аккауни")
                            //                                            .foregroundColor(.red)//why not
                            //                                    }
                            //
                            //
                            //
                            //                                }
                            //                                .position(x: geometry.size.width - 30, y: 20)
                        }
                        
                    }.frame(height: 44)
                    HStack{
                        Circle()
                            .frame(width: 77, height: 77)
                            .foregroundColor(.gray)
                        VStack{
                            Text("Иван Иванов")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .frame(width: 128, height: 24)
                                .font(.system(size: 20))
                            
                            Text("+79999999909")
                                .frame(width: 127, height: 21)
                                .font(.system(size: 17))
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                        
                    }.frame(height: 80)
                        .padding(.all, 16)
                    HStack{
                        GeometryReader{ geometry in
                            Button{}label: {
                                Text("Мое резюме")
                                    .frame(width: geometry.size.width - 32, height: 60)
                                    .background(Color.black)
                                    .cornerRadius(13)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                            }
                        }.frame(height: 60)
                    }.padding(.top, 20)
                }
                ScrollView{
                    GeometryReader{ g in
                        
                        Text("Дата рождения")
                            .foregroundColor(.gray)
                            .padding(.top, 36)
                            .font(.system(size:15))
                        
                        
                        Text("01.01.2000")
                            .padding(.top, 55)
                            .font(.system(size:17))
                        
                        Group{
                            Text("Место учёбы")
                                .foregroundColor(.black)
                                .padding(.top, 92)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                            
                            Text("Университет")
                                .padding(.top, 119)
                                .foregroundColor(.gray)
                                .font(.system(size:15))
                            Text("Казанский (Приволжский федеральный университет)")
                                .font(.system(size: 17))
                                .lineLimit(1)
                                .padding(.top, 140)
                            Divider()
                                .padding(.top, 169)
                            
                            Group{
                                Text("Институт")
                                    .padding(.top, 181)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                                Text("Институт вычислительной математики и информационной технологии")
                                    .font(.system(size: 17))
                                    .lineLimit(1)
                                    .padding(.top, 200)
                                Divider()
                                    .padding(.top, 229)
                                
                            }
                            Group{
                                Text("Направление")
                                    .padding(.top, 241)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                                Text("Бизнес - информатика")
                                    .font(.system(size: 17))
                                    .lineLimit(1)
                                    .padding(.top, 262)
                                Text("О себе")
                                    .font(.system(size: 20))
                                    .padding(.top, 294)
                                    .fontWeight(.bold)
                                
                                Text("Казанский (Приволжский) федеральный университет")
                                    .lineLimit(1)
                                    .font(.system(size: 17))
                                    .padding(.top, 323)
                                
                                
                            }
                            
                        }
                    }
                    .padding(.leading, 16)
                    .frame(height: 380)
                    VStack{
                        GeometryReader{ geometry in
                            
                            Button{}label:{
                                Text("Тех.поддержка")
                                    .frame(width: geometry.size.width - 32, height: 60)
                                    .background(Color.black)
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(.white)
                            .cornerRadius(13)
                            .padding(.leading, 16.0)
                            
                            Button{}label:{
                                Text("Выйти")
                                    .frame(width: geometry.size.width - 32, height: 60)
                                    .font(.system(size: 20))
                                    .background(Color.black)
                            }
                            .foregroundColor(.white)
                            .cornerRadius(13)
                            .padding(.top, 70)
                            .padding(.leading, 16)
                        }.frame( height: 150)
                    }
                }
                Spacer()
            }
            
            
            
            
            
            
        }
        
    }
}

struct ProfileMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMainView()
    }
}



//
//    .toolbar{
//
//        ToolbarItem(placement: .navigationBarLeading){
//            Image(systemName: "bell")
//                .foregroundColor(.black)
//
//        }
//
//        ToolbarItem(placement: .principal){
//            Text("Профиль")
//        }
//        ToolbarItem(placement: .navigationBarTrailing){
//
//
//
//
//
//        }
//    }
