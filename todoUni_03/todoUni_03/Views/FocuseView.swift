
import SwiftUI
import UserNotifications

//struct FocuseView: View {
//
//
//    var body: some View {
//            VStack{
//                AllMagicIsHere()
//            }
//            .toolbar{
//                Button{
//                    self.showFocuseView.toggle()
//
//                }label:{
//                    Image(systemName: "xmark")
//                        .foregroundColor(Color("dark"))
//                        .padding(.trailing)
//
//                }
//            }
//    }
//}


struct FocuseView: View{
    @EnvironmentObject var focuseModel: FocuseModel
    
    @Binding var showFocuseView: Bool
    
    //@State var start: Bool = false
    @State var to: CGFloat = 0
    //@EnvironmentObject var focuseModel: FocuseModel
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{
    
    
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.black.opacity(0.09),style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
                Circle()
                    .trim(from: 0, to: focuseModel.progress)
                    .stroke(Color("light") ,style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: -90))
                VStack{
                    Text(focuseModel.timerStringValue)
                        .font(.system(size: 65))
                        .fontWeight(.bold)
                        .animation(.none, value: focuseModel.progress)
    
                }
                .foregroundColor(Color("dark"))
            }
            .animation(.easeIn, value: focuseModel.progress)
            HStack(spacing: 20){
                Button{
                    if focuseModel.isStarted{
    
                    }else{
                        focuseModel.addNewTimer = true
                    }
    
                }label: {
                    HStack(spacing: 15){
                        Image(systemName: focuseModel.isStarted ? "pause.fill": "play.fill")
                            .foregroundColor(.white)
                        Text(focuseModel.isStarted ? "Pause": "Play")
                            .foregroundColor(.white)
                    }.padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width/2)-55)
                        .background(Color("dark"))
                        .clipShape(Capsule())
                        .shadow(radius: 6)
                }
                Button{
                    self.count = 0
                    withAnimation(.default){
                        self.to = 0
                    }
                }label: {
                    HStack(spacing: 15){
                        Image(systemName: "arrow.clockwise")
    
                        Text("Restart")
    
                    }
                    .foregroundColor(Color("dark"))
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width/2)-55)
                    .background(
                        Capsule()
                            .stroke(Color("dark"), lineWidth: 2)
                    )
                    .shadow(radius: 6)
                }
            }
            .padding(.top, 55)
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity, alignment:.center)
        .background{
            Color.white
                .ignoresSafeArea()
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]){(_, _ )in
    
            }
        })
        .onReceive(self.time){ (_) in
    
        }
        .overlay(content:{
            ZStack{
                Color.white
                    .opacity(focuseModel.addNewTimer ? 0.25: 0)
                    .onTapGesture{
                        focuseModel.hour = 0
                        focuseModel.seconds = 0
                        focuseModel.minutes = 0
                        focuseModel.addNewTimer = false
                    }
                NewTimerView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y:focuseModel.addNewTimer ? 0: 400)
            }
            .animation(.easeInOut, value: focuseModel.addNewTimer)
        })
    }

    func Notify(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer is completed Successfully in back"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler:nil)
    }
    
    @ViewBuilder
    func NewTimerView()->some View{
        VStack(spacing: 15){
            Text("Add New Timer")
                .font(.title.bold())
                .foregroundColor(Color.white)
                .padding(.top, 10)
            HStack{
                Text("\(focuseModel.hour) hr")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 12, hint: "hr") { value in
                            focuseModel.hour = value
                        }
                    }
                Text("\(focuseModel.minutes) min")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 59, hint: "min") { value in
                            focuseModel.minutes = value
                        }
                    }
                Text("\(focuseModel.seconds) sec")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 59, hint: "sec") { value in
                            focuseModel.seconds = value
                        }
                    }
            }
            .padding(.top, 20)
            Button{
                
            }label: {
                Text("save")
                    .foregroundColor(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.horizontal, 100)
                    .background{
                        Capsule()
                            .fill(Color("light"))
                    }
            }//.disabled(focuseModel.seconds == 0)
                .opacity(focuseModel.seconds == 0 ? 0.5 : 1)
                .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color("dark"))
                .ignoresSafeArea()
        }
    }
    @ViewBuilder
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping(Int)->())-> some View{
        ForEach(0...maxValue, id:\.self){value in
            Button("\(value) \(hint)"){
                onClick(value)
            }
        }
    }
}



struct FocuseView_Previews: PreviewProvider {
    static var previews: some View {
        FocuseView(showFocuseView: .constant(true))
            .environmentObject(FocuseModel())
    }
}


//Чтобы узнать увеличенное расстояние, необходимо разделить время пути на скорость: 28800 sec / 15 sec/distance = 1920 distance. Таким образом, расстояние должно быть увеличено в 1920 раз.


//
//
