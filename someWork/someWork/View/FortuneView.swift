
import SwiftUI

struct FortuneView: View {
    @State private var rotation: Double = 0
    @State private var randomAngle: Double = 0
    let animation = Animation.linear(duration: 2)
    
    @State private var textInt = 0
    var body: some View {
        ZStack{
            Color.yellow
            VStack {
                Text("\(textInt)")
                    .foregroundColor(Color.black)
                
                Image("img")
                    .resizable()
                    .frame(width: 450, height: 450)
                    .rotationEffect(.degrees(rotation))
                    .animation(animation)
                
                Button("Randomize Rotation") {
                    
                    
                    self.randomAngle = Double.random(in: 360...720)
                    self.textInt += Int.random(in: 0...100)
                    withAnimation(self.animation) {
                        self.rotation = self.randomAngle
                    }
                    
                    
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
    }
}



struct FortuneView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneView()
    }
}
