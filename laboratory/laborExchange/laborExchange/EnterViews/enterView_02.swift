//
//  enterView_02.swift
//  laborExchange
//
//  Created by Islombek Gofurov on 02.04.2023.
//

import SwiftUI




struct enterView_02: View {
    @State private var path_enterView_02 = NavigationPath()
    @State private var student:studentInfo = studentInfo()
    @State private var progress:Int = 0
    
    @State private var lastName:String = ""
    @State private var firstName:String = ""
    @State private var patronimyc:String = ""
    @State private var gender: Bool = true
    @State private var city: String = ""
    @State private var course: Int = 1
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var phoneNumber:String = ""
    
    
//    @State private var isViewVisible = false
//    @State private var isUpButtonTapped = false
    
    @State private var isMarkedMale = true
    @State private var isMarkedFeMale = false
    
    @State private var isMarkedStudent = true
    @State private var isMarkedOrganization = false
    
    var body: some View {
        NavigationStack(path: $path_enterView_02){
            
            
//            VStack {
//                Spacer().frame(height: 50)
//
//                VStack {
//                    Text("Личные данные")
//                        .frame(width: 323)
//                        .font(.system(size: 28))
//                        .multilineTextAlignment(.center)
//                        .padding(.top)
//
//                    HStack {
//                        Text("Роль*")
//                            .padding(.top, -20)
//                            .padding(.leading, -120)
//                            .multilineTextAlignment(.leading)
//                            .frame(width: 323, height: 46)
//                            .font(.system(size: 15))
//                    }
//
//                    HStack {
//                        Button(action: {
//                            if isMarkedFeMale {
//                                withAnimation {
//                                    isMarkedFeMale = false
//                                    isMarkedMale = true
//                                }
//                            }
//                        }) {
//                            Group {
//                                Image(systemName: self.isMarkedMale ? "largecircle.fill.circle" : "circle")
//                                    .clipShape(Circle())
//                                    .foregroundColor(.black)
//                                Text("Студент")
//                            }
//                            .foregroundColor(.black)
//                        }
//
//                        Button(action: {
//                            if isMarkedMale {
//                                withAnimation {
//                                    isMarkedMale = false
//                                    isMarkedFeMale = true
//                                }
//                            }
//                        }) {
//                            Group {
//                                Image(systemName: self.isMarkedFeMale ? "largecircle.fill.circle" : "circle")
//                                    .clipShape(Circle())
//                                    .foregroundColor(.black)
//                                Text("Организация")
//                            }
//                            .foregroundColor(.black)
//                        }
//                    }
//                    .padding(.top, -10)
//
//                    Text("*Обязательное поле")
//                        .padding(.leading, -80)
//                        .padding(.top, 15)
//
//                    Button(action: {
//                        withAnimation {
//                            addProgress()
//                        }
//                    }) {
//                        Text("Далее")
//                            .frame(width: 323, height: 46)
//                            .background(Color.black)
//                            .cornerRadius(13)
//                            .foregroundColor(.white)
//                    }
//                    .padding(.horizontal, 30)
//                    .padding(.bottom, 20)
//                }
//                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
//                .padding(.horizontal)
//
//                Spacer().frame(height: 20)
//            }
//            .offset(x: progress == 0 ? 0 : 600)
            
            
            
            
            VStack{
                Spacer()
                    .frame(height: 50)
                VStack{
                    Text("Личные данные")
                        .font(.system(size: 28))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    
                    TextField("Фамилия*", text: $email)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                    TextField("Имя*", text: $password)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                    TextField("Отчество*", text: $email)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal)
                   
                    Group{
                        HStack{
                            Text("Пол*")
                                .padding(.leading, -175)
//                                .multilineTextAlignment(.leading)
                                .font(.system(size: 15))
                                
                      
                        }
                        HStack{
                            Button{
                               
                                if isMarkedFeMale {
                                    withAnimation {
                                        isMarkedFeMale = false
                                        isMarkedMale = true
                                    }
                                }
                            }label: {
                                Group{
                                    Image(systemName: self.isMarkedMale ? "largecircle.fill.circle" : "circle")
                                                       .clipShape(Circle())
                                                       .foregroundColor(.black)
                                    Text("Мужской")
                                }          .foregroundColor(.black)
                            }
                            Button{
                                if isMarkedMale{
                                    withAnimation {
                                        isMarkedMale = false
                                        isMarkedFeMale = true
                                    }
                                }
                            }label: {
                                Group{
                                    Image(systemName: self.isMarkedFeMale ? "largecircle.fill.circle" : "circle")
                                                       .clipShape(Circle())
                                                       .foregroundColor(.black)
                                    Text("Женский")
                                }          .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                    
                    Button{
                        withAnimation{
                            addProgress()
                        }
                        
                    }label: {
                        Text("Далее")
                        
                            .frame(width: 323, height: 46)
                            .background(Color.black)
                            .cornerRadius(13)
                            .foregroundColor(.white)
                    }.padding(.top)
                    Spacer().frame(height: 20)
                    
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .padding(.horizontal)
                
                
                Spacer()
            }
//            .offset(x:progress == 1 ? 0 : 600)
            .offset(x:progress == 1 ? 0 : 600)
          
            
            VStack{
                Text("Личные данные")
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                HStack{
                    Text("Роль*")
                        .padding(.top, -20)
                        .padding(.leading, -150)
                        .multilineTextAlignment(.leading)
                        .frame(width: 323, height: 46)
                        .font(.system(size: 15))
                        
              
                }
                HStack{
                    Button{
                       
                        if isMarkedStudent {
                            withAnimation {
                                isMarkedStudent = false
                                isMarkedOrganization = true
                            }
                        }
                    }label: {
                        Group{
                            Image(systemName: self.isMarkedStudent ? "largecircle.fill.circle" : "circle")
                                               .clipShape(Circle())
                                               .foregroundColor(.black)
                            Text("Студент")
                        }          .foregroundColor(.black)
                    }
                    Button{
                        if isMarkedOrganization{
                            withAnimation {
                                isMarkedOrganization = false
                                isMarkedStudent = true
                            }
                        }
                    }label: {
                        Group{
                            Image(systemName: self.isMarkedOrganization ? "largecircle.fill.circle" : "circle")
                                               .clipShape(Circle())
                                               .foregroundColor(.black)
                            Text("Организация")
                        }          .foregroundColor(.black)
                    }
                    
                    }
                .padding(.leading, -70)
                HStack{
                    Text("*Обязательное поле")
                        .padding(.top, 10)
                    Spacer()
                        .frame(width: 150)
                }
                    
                Button{
                    withAnimation{
                        addProgress()
                    }
                    
                }label: {
                    Text("Далее")
                    
                        .frame(width: 323, height: 46)
                        .background(Color.black)
                        .cornerRadius(13)
                        .foregroundColor(.white)
                }.padding(.top)
                Spacer().frame(height: 20)
                    
            }
            .padding(.horizontal)
//            .padding(.top, 20)
                        
            
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.top, 200)

            
            .offset(y:progress == 0 ? -570 : 600)
            
            
            
            .navigationTitle("Регистрация")
            
        }
    }
    func addProgress(){
        guard progress < 3 else{
            progress = 0
            return
        }
        progress += 1
    }
    
}
//struct choseRole: View {
//    var body: some View {
//        Text("sdf")
//
//    }
//}



struct enterView_02_Previews: PreviewProvider {
    static var previews: some View {
        enterView_02()
    }
}



//            VStack{
//                Spacer()
//                    .frame(height: 50)
//                VStack{
//                    Text("Личные данные")
//                        .frame(width: 323)
//                        .font(.system(size: 28))
//                        .multilineTextAlignment(.center)
//                        .padding(.top)
//                    HStack{
//                        Text("Роль*")
//                            .padding(.top, -20)
//                            .padding(.leading, -120)
//                            .multilineTextAlignment(.leading)
//                            .frame(width: 323, height: 46)
//                            .font(.system(size: 15))
//
//
//                    }
//                    HStack{
//                        Button{
//                            if isMarkedFeMale{
//                                isMarkedFeMale = false
//                                isMarkedMale = true
//                            }
//                        }label: {
//                            Group{
//                                Image(systemName: self.isMarkedMale ? "largecircle.fill.circle" : "circle")
//                                                   .clipShape(Circle())
//                                                   .foregroundColor(.black)
//                                Text("Студент")
//                            }          .foregroundColor(.black)
//                        }
//                        Button{
//                            if isMarkedMale{
//                                isMarkedMale = false
//                                isMarkedFeMale = true
//                            }
//                        }label: {
//                            Group{
//                                Image(systemName: self.isMarkedFeMale ? "largecircle.fill.circle" : "circle")
//                                                   .clipShape(Circle())
//                                                   .foregroundColor(.black)
//                                Text("Организация")
//                            }          .foregroundColor(.black)
//                        }
//                    }
//                    .padding(.top, -10)
//                    Text("*Обязательное поле")
//                        .padding(.leading, -80)
//                        .padding(.top, 15)
//                    Button{
//                        addProgress()
//                    }label: {
//                        Text("Далее")
//
//                            .frame(width: 323, height: 46)
//                            .background(Color.black)
//                            .cornerRadius(13)
//                            .foregroundColor(.white)
//                    }
////                    .padding(.top)
//                    .padding(.horizontal, 30)
//                    Spacer().frame(height: 20)
//                }
//                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
//                .padding(.horizontal)
//            }
//            .offset(y:progress == 0 ? 0 : 600)
//            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
