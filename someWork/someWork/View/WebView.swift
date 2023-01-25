
import SwiftUI

import WebKit



struct WebView1: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}



struct WebView: View {
    @State var sharedUrl: String
    var body: some View {
        WebView1(request: URLRequest(url: URL(string: "\(sharedUrl)")!))
    }
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView(sharedUrl: Dane)
//    }
//}
