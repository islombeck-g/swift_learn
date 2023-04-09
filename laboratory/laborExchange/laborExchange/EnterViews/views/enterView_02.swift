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
    
    
    @State private var selectedCity = "Город*"
    @State private var selectedUnivercity = "Учебное заведение*"
    
    
    
    @State private var isMarkedStudent = true
    @State private var isMarkedOrganization = false
    var body: some View {
        NavigationStack(path: $path_enterView_02){
            
            ZStack{
                
                Color(.black)
                    .ignoresSafeArea()
                GeometryReader{ geometry in
                    
                    Text("Регистрация")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .position(y: 71)
                        .padding(.leading, 116)
                    
                    enterView_02_00(addProgress: addProgress)
                        .offset(x: progress == 0 ? 10 : geometry.size.width, y: 123)
                    
                    enterView_02_01(lastName: lastName, firstName: firstName, patronimyc: patronimyc, gender: gender, addProgress: addProgress)
                        .offset(x: progress == 1 ? 10 : geometry.size.width, y: 123)
                    
                    enterView_02_02(addProgress: addProgress, selectedOption: selectedCity, selectedUnivercity: selectedUnivercity, phoneNumber: phoneNumber)
                        .offset(x:progress == 2 ? 10: geometry.size.width, y: 123)
                    
                    enterView_02_03(addProgress: addProgress, email: email, password: password)
                        .offset(x:progress == 3 ? 10: geometry.size.width, y: 123)
                    
                }
                
                
                
            }
            
            .navigationDestination(for: String.self){view in
                if view == "studentInfoCorrecr" {
                    MainViewOfStudent()
                }
                else if view == "sellerinfoCorrect" {
                    MainViewOfSeller()
                }
                
            }
        }
    }
    func addProgress(){
        guard progress < 3 else{
            if isMarkedStudent{
                checkStudentInfo()
            }else{
                checkSellerInfo()
            }
            return
        }
        progress += 1
    }
    func checkStudentInfo(){
        path_enterView_02.append("studentInfoCorrecr")
    }
    func checkSellerInfo(){
        path_enterView_02.append("sellerinfoCorrect")
    }
    
}



struct enterView_02_Previews: PreviewProvider {
    static var previews: some View {
        enterView_02()
    }
}


struct enterView_02_03: View {
    var addProgress:()-> Void
    
    @State public var email:String
    @State public var password:String
    @State private var userAgreement = false
    @State private var userMailingAccess = false

    var body: some View {
        GeometryReader{geometry in
            VStack{
                Text("Личные данные")
                    .frame(width: geometry.size.width-20)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.top)
           
                
                TextField("Почта*", text: $email)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
                
                TextField("Пароль*", text: $password)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
                
                TextField("Повторить пароль*", text: $password)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
           
                Group{
                    Button{
                        if userMailingAccess {
                            withAnimation {
                                userMailingAccess = false
                            }
                        }else{
                            withAnimation {
                                userMailingAccess = true
                            }
                        }
                    } label: {
                        HStack{
                            Image(systemName: self.userMailingAccess ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
//                            Spacer() // Add Spacer here
                            Text("Я согласен(-а) на получение рассылки на e-mail")
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 15))
                            Spacer()
                        }
                    }
                    .foregroundColor(.black)

                    Button{
                        if userAgreement {
                            withAnimation {
                                userAgreement = false
                            }
                        }else{
                            withAnimation {
                                userAgreement = true
                            }
                        }
                    } label: {
                        HStack{
                            Image(systemName: self.userAgreement ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            Text("Я согласен(-а) с пользовательским соглашения")
                                .lineLimit(2)
                                .font(.system(size: 15))
                                .multilineTextAlignment(.leading)
                            Spacer()
                               
                        }
                    }
                    .foregroundColor(.black)

                }
                .frame(width: geometry.size.width-50, height: 46)

                
                    
                
                
                
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

