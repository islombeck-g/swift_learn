
import SwiftUI

struct gamersNameChange: View {
    @EnvironmentObject var s1: GameSettings
    @State private var people: [String] = []
    
    var body: some View {
        ScrollView {
            HStack{
                Button{
                    addPeopleName()
                    print(people)
                }label: {
                    Text("someNew")
                }
            }
        }
    }
    
    func addPeopleName(){
        for i in 0..<(s1.countAllPlayers-1){
            people.append("Игрок \(i)")
        }
    }
}

struct gamersNameChange_Previews: PreviewProvider {
    static var previews: some View {
        gamersNameChange()
            .environmentObject(GameSettings())
    }
}
