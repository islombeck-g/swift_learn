
import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center){
                VStack{
                }
                .padding(.vertical, 90.0)
                VStack {
                    Text("Mафия")
                        .bold()
                        .font(.system(size: 45))
                    Text("Начни игру прямо сейчас")
                }
                .padding(80)
                
                NavigationLink(destination: CountOfGamersView()){
                    Text("create game")
                }
                .padding(.vertical, 12.0)
                .padding(.horizontal, 45.0)
                .foregroundColor(Color("text_white_black"))
                .background(
                    Color("button_black_white")
                        .cornerRadius(10)
                )
                .padding(40)
                
                VStack{
                    Text("  Мафия признана одной из 50 наиболее исторически и культурно существенных игр, появившихся с 1800 года")
                }
                .padding()
                .foregroundColor(.gray)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
