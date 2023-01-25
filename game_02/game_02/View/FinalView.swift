import SwiftUI



struct FinalView: View {
    @State private var users = ["User 1", "User 2", "User 3"]
    @ObservedObject var s: GameSettingsViewModel
       var body: some View {
           NavigationView {
               List {
                   ForEach(0...s.countAllGamers()-1, id: \.self) { id in
                       HStack{
                           Text(s.getName(index: id))
                           Image(s.getIcon(index: id))
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                       }
                       .frame(width: 100.0, height: 20.0)
                       
                   }
                   .onDelete(perform: delete)
               }
               .navigationBarTitle("Роли игроков")
              
           }.navigationBarHidden(true)
       }

       private func delete(at offsets: IndexSet) {
           users.remove(atOffsets: offsets)
       }
           
                
        
        
    }


struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(s: GameSettingsViewModel())
    }
}




