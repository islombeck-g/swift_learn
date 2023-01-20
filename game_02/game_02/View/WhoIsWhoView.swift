
import SwiftUI

struct WhoIsWhoView: View {
    
    @ObservedObject var s: GameSettingsViewModel
    @State public var currentIndex:Int = 0
    
    @State private var degrees:Double = 0
    @State private var flipped:Bool = true
    @State public var someText:String = ""
    @State public var someIcon:String = ""
    var body: some View {
        VStack{
            Spacer()
            PersonCardView{
                VStack{
                    
                    if flipped {
                        PersonCardFront(someText: someText)
                        
                    }else{
                        PersonCardBack(picture: someIcon)
                    }
                    
                }
                .rotation3DEffect(.degrees(degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
                
            }.onTapGesture {
                withAnimation{
                    degrees += 180
                    flipped.toggle()
                }
                
                
            }
            Spacer()
            Button{
              
                if flipped == false{
                    withAnimation{
                        degrees += 180
                        flipped.toggle()
                    }
                    
                }
                self.nextPerson()
                self.currentIndex += 1
                
            }label: {
                if self.currentIndex == s.countAllGamers(){
                    NavigationLink(destination: FinalView(s:s)) {
                        Text("Начать игру")
                            .frame(maxWidth: 270, minHeight: 40)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(Color("button_black_white"))
                            .shadow(radius: 15)
                    }
                }else{
                    Text("Следующий игрок")
                        .frame(maxWidth: 270, minHeight: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(Color("button_black_white"))
                        .shadow(radius: 15)
                    
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        
        
        
    }
    
    func nextPerson(){
        someText = s.getName(index: currentIndex)
        someIcon = s.getIcon(index: currentIndex)
    }
}


struct WhoIsWhoView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsWhoView(s:GameSettingsViewModel())
    }
}
