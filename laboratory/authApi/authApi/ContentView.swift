
import SwiftUI

import Firebase



struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorEmail = ""
    @State private var showError: Bool = false
    @State private var userIsLogged = false
    var body: some View {
        if userIsLogged{
            oneView(userIsLogged: $userIsLogged)
        }else{
            content
        }
    }
    var content:some View{
        VStack{
            TextField("Email", text: $email)
                .padding(.leading)
            Rectangle()
                .frame (height: 2)
            
            TextField("Password", text: $password)
                .padding(.leading)
            HStack{
                Spacer()
                Button{
                    register()
                }label: {
                    Text("register")
                }
                Spacer()
                Button{
                    logIn()
                }label: {
                    Text("logIn")
                }
                Spacer()
            }
            if showError {
                Text(errorEmail)
                
            }
            
            
        }.onAppear{
            Auth.auth().addStateDidChangeListener{auth, user in
                if user != nil{
                    userIsLogged = true
                }
                
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if error != nil{
                print(error!.localizedDescription)
                errorEmail = error!.localizedDescription
                showError = true
            }
            else {
                showError = false
                errorEmail = ""
            }
           
        }
        email = ""
        password = ""
    }
    
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
                errorEmail = error!.localizedDescription
                showError = true
                
            }
            else {
                showError = false
                errorEmail = ""
            }
        }
        email = ""
        password = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
