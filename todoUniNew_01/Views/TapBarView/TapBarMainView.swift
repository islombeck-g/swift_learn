

import SwiftUI

enum Tabs:Int{
    case home = 0
    case focuse = 1
    case add = 2
}


struct TapBarMain: View {
    @Binding var selectedTap:Tabs
    
    var body: some View {
        HStack(alignment: .center){
                Button{
                    selectedTap = .home
                }label: {
                    TapBarButton(buttonName: "Home",
                                 buttonIcon: "house.fill",
                                 buttonIsActive: selectedTap == .home)
            }
            .foregroundColor(Color("icon-secondary"))
            Button{
                selectedTap = .add
            }label: {
                
                VStack{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                
                    .frame(width: 32, height: 32)
                Text("Add")
            }
        }
        .foregroundColor(Color("icon-primary"))
        
            Button{
                selectedTap = .focuse
            }label: {
                
                TapBarButton(buttonName: "Focuse",
                             buttonIcon: "clock.fill",
                             buttonIsActive: selectedTap == .focuse)
        }
        .foregroundColor(Color("icon-secondary"))
        }
        .frame(height: 82)
    }
}

struct TapBarMain_Previews: PreviewProvider {
    static var previews: some View {
        TapBarMain(selectedTap: .constant(.home))
    }
}
