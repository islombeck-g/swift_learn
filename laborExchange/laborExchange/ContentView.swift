
import SwiftUI

struct ContentView: View {
    @State private var someValue:Bool = false
    var body: some View {
        
        
        VStack{
            ChangeView{
                VStack{
                    if someValue{
                        MainMainView()
                    }else{
                        ProfileMainView()
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
