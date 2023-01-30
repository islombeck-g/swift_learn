
import SwiftUI
import UserNotifications
struct FocuseView: View {
    var body: some View {
        ZStack{
            AllMagicIsHere()
        }
    }
}


struct AllMagicIsHere: View{
    @State var start: Bool = false
    @State var to: CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{
        ZStack{
            
            VStack{
                ZStack{
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09),style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                    Circle()
                        .trim(from: 0, to: self.to/1920)
                        .stroke(Color("light") ,style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    VStack{
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        Text("of 8 hours")
                            .font(.title)
                        
                    }
                    .foregroundColor(Color("dark"))
                }
                HStack(spacing: 20){
                    Button{
                        if self.count == 15{
                            self.count = 0
                            withAnimation(.default){
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                    }label: {
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill": "play.fill")
                                .foregroundColor(.white)
                            Text(self.start ? "Pause": "Play")
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
            
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]){(_, _ )in
                
            }
        })
        .onReceive(self.time){ (_) in
            if self.start{
                if self.count != 28800{
                    self.count += 1
                    withAnimation(.default){
                        self.to = CGFloat(self.count)/15
                    }
                }else{
                    self.start.toggle()
                    self.Notify()
                }
               
            }
        }
    }
    func Notify(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer is completed Successfully in back"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler:nil)
    }
}



struct FocuseView_Previews: PreviewProvider {
    static var previews: some View {
        FocuseView()
    }
}


//Чтобы узнать увеличенное расстояние, необходимо разделить время пути на скорость: 28800 sec / 15 sec/distance = 1920 distance. Таким образом, расстояние должно быть увеличено в 1920 раз.
