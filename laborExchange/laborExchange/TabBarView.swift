
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ProfileMainView()
                .tabItem{
                    Image(systemName: "house")
                }
            Text("he")
                .tabItem{
                    Image(systemName: "house")
                }
        }.background(Color.red)
    }
}

struct TapBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
