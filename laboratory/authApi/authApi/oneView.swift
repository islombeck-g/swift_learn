
import SwiftUI
import Firebase



struct oneView: View {
    @Binding public var userIsLogged:Bool
    @EnvironmentObject var dat: DataManajer
    var body: some View {
        NavigationView{
            VStack{
             
                ScrollView(.horizontal){
                    HStack{
                        ForEach(dat.jobs, id: \.id) { park in
                            NavigationLink(destination: example() ){
                                
                                JobsScrollView()
                                    .padding(.leading, 16)
                            }
                        }
                    }
                }
               
                
                
//                ScrollView(.horizontal){
//
//                    HStack{
//
//                        ForEach(0..<10){index in
//                            JobsScrollView()
//
//                        }
//
//                    }
//                }
//                .padding(.leading, 16)
                Button{
                    do {
                        
                        try Auth.auth().signOut()
                        
                    } catch let signOutError as NSError {
                        
                        print ("Error signing out: %@", signOutError)
                        
                    }
                    userIsLogged.toggle()
                }label: {
                    Text("stopSession")
                }
                
            }
            
        }
    }
}

struct oneView_Previews: PreviewProvider {
    static var previews: some View {
        oneView(userIsLogged: .constant(true))
        //        oneView(userIsLogged: .constant(true))
    }
}


//ScrollView(.horizontal){
//                    HStack{
//
//                            List(data.jobs, id:\.id){ job in
//                                Text(job.companyName)
//
//                            }
//
//                    }
//
//                }
