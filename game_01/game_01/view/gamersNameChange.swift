
import SwiftUI



struct gamersNameChange: View {
    @ObservedObject var s: GameSettings
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
        for i in 0..<(s.countAllPlayers){
            people.append("Игрок \(i)")
        }
    }
}

struct gamersNameChange_Previews: PreviewProvider {
    static var previews: some View {
        gamersNameChange(s: GameSettings())
    }
}
