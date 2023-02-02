////
////  Example.swift
////  todoUni_03
////
////  Created by Islombek Gofurov on 02.02.2023.
////
//
//
//
//import SwiftUI
//
//struct Example: View {
//    var body: some View {
//        VStack{
//            Text("Some Big")
//            GeometryReader{ proxy in
//                VStack(spacing: 15){
//                    ZStack{
//                        Circle()
//                            .trim(from: 0, to:  1)
//                            .stroke(Color.black.opacity(0.09),style: StrokeStyle(lineWidth: 35, lineCap: .round))
//                            .frame(width: 280, height: 280)
//                        Circle()
//                           // .trim(from: 0, to: focuseModel.progress)
//                            .stroke(Color("light") ,style: StrokeStyle(lineWidth: 35, lineCap: .round))
//                            .frame(width: 280, height: 280)
//                        Text(focusemodel.timerStringValue)
//                            .font(.system(size: 45, weight: .light))
//                            .rotationEffect(.init(degrees: -90))
//                            .animation(.none, value: focuseModel.progress)
//                       
//                    }
//                    .padding(60)
//                    .frame(height: proxy.size.width)
//                    .rotationEffect(.init(degrees: -90))
//                    .animation(.easeInOut, value: focuseModel.progress)
//                    .frame(maxWidth: .infinity, maxHeight:.infinity, alignment:.center)
//                    HStack(spacing: 20){
//                        Button{
//                            if focuseModel.isStarted{
//                                
//                            }else{
//                                focuseModel.addNewTimer = true
//                            }
//                            
//                        }label: {
//                            HStack(spacing: 15){
//                                Image(systemName: focuseModel.isStarted ? "pause.fill": "play.fill")
//                                    .foregroundColor(.white)
//                                Text(focuseModel.isStarted ? "Pause": "Play")
//                                    .foregroundColor(.white)
//                            }.padding(.vertical)
//                                .frame(width: (UIScreen.main.bounds.width/2)-55)
//                                .background(Color("dark"))
//                                .clipShape(Capsule())
//                                .shadow(radius: 6)
//                        }
//                        Button{
//                            self.count = 0
//                            withAnimation(.default){
//                                self.to = 0
//                            }
//                        }label: {
//                            HStack(spacing: 15){
//                                Image(systemName: "arrow.clockwise")
//                                
//                                Text("Restart")
//                                
//                            }
//                            .foregroundColor(Color("dark"))
//                            .padding(.vertical)
//                            .frame(width: (UIScreen.main.bounds.width/2)-55)
//                            .background(
//                                Capsule()
//                                    .stroke(Color("dark"), lineWidth: 2)
//                            )
//                            .shadow(radius: 6)
//                        }
//                    }
//                }
//                .frame(maxWidth: .infinity, maxHeight:.infinity, alignment:.center)
//                
//            }
//            
//        }
//        .padding()
//        .background{
//            Color("light")
//                .ignoresSafeArea()
//        }
//        .overlay(content:{
//            ZStack{
//                Color.white
//                    .opacity(focuseModel.addNewTimer ? 0.25: 0)
//                    .onTapGesture{
//                        focuseModel.addNewTimer = false
//                        focuseModel.hour = 0
//                        focuseModel.seconds = 0
//                        focuseModel.minutes = 0
//                        
//                    }
//                NewTimerView()
//                    .frame(maxHeight: .infinity, alignment: .bottom)
//                    .offset(y:focuseModel.addNewTimer ? 0: 400)
//            }
//            .animation(.easeInOut, value: focuseModel.addNewTimer)
//        })
//    }
//    
//    @ViewBuilder
//    func NewTimerView()->some View{
//        VStack(spacing: 15){
//            Text("Add New Timer")
//                .font(.title.bold())
//                .foregroundColor(Color.white)
//                .padding(.top, 10)
//            HStack{
//                Text("\(focuseModel.hour) hr")
//                    .foregroundColor(Color.white)
//                      .font(.title3)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 12)
//                    .background{
//                        Capsule()
//                            .fill(.white.opacity(0.07))
//                    }
//                    .contextMenu{
//                        ContextMenuOptions(maxValue: 12, hint: "hr") { value in
//                            focuseModel.hour = value
//                        }
//                    }
//                Text("\(focuseModel.minutes) min")
//                    .foregroundColor(Color.white)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 12)
//                    .background{
//                        Capsule()
//                            .fill(.white.opacity(0.07))
//                    }
//                    .contextMenu{
//                        ContextMenuOptions(maxValue: 59, hint: "min") { value in
//                            focuseModel.minutes = value
//                        }
//                    }
//                Text("\(focuseModel.seconds) sec")
//                    .foregroundColor(Color.white)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 12)
//                    .background{
//                        Capsule()
//                            .fill(.white.opacity(0.07))
//                    }
//                    .contextMenu{
//                        ContextMenuOptions(maxValue: 59, hint: "sec") { value in
//                            focuseModel.seconds = value
//                        }
//                    }
//            }
//            .padding(.top, 20)
//            Button{
//                
//            }label: {
//                Text("save")
//                    .foregroundColor(Color.white)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .padding(.vertical)
//                    .padding(.horizontal, 100)
//                    .background{
//                        Capsule()
//                            .fill(Color("light"))
//                    }
//            }
//            .disabled(focuseModel.seconds == 0)
//                .opacity(focuseModel.seconds == 0 ? 0.5 : 1)
//                .padding(.top)
//        }
//        .frame(maxWidth: .infinity)
//        .padding()
//        .background{
//            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .fill(Color("dark"))
//                .ignoresSafeArea()
//        }
//    }
//    @ViewBuilder
//    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping(Int)->())-> some View{
//        ForEach(0...maxValue, id:\.self){value in
//            Button("\(value) \(hint)"){
//                onClick(value)
//            }
//        }
//    }
//}
//
//struct Example_Previews: PreviewProvider {
//    static var previews: some View {
//        Example()
//    }
//}
