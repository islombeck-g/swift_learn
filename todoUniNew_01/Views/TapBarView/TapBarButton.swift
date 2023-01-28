
import SwiftUI

struct TapBarButton: View {
    var buttonName:String
    var buttonIcon:String
    var buttonIsActive:Bool
    
    var body: some View {
        GeometryReader{ geo in
            if buttonIsActive {
                Rectangle()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .foregroundColor(Color.blue)
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            
            
            VStack(alignment: .center, spacing: 4){
                Image(systemName: "\(buttonIcon)")
                    .resizable()
                    
                    .frame(width: 24, height: 24)
                Text("\(buttonName)")
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }

    }
}

struct TapBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TapBarButton(buttonName: "chats", buttonIcon: "bubble.left", buttonIsActive: true)
    }
}
