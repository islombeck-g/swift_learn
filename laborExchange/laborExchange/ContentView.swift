
import SwiftUI

struct ContentView: View {
    @State private var someValue:Bool = false
    var body: some View {
        
        NavigationView{
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
}


struct ChangeView<Content>: View where Content:View {
    var content:()->Content
    var body: some View {
        content()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//узнать про переходы в view
//спросить почему кнопка не красится в красный цвет

