
import SwiftUI
import OctoKit

struct ContentView: View {
    let strings = somefunc()
    
    var body: some View {
        List {
            ForEach(strings.identified(by: \.self)) { string in
                Text(string)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
