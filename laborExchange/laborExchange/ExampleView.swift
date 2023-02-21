

import SwiftUI

struct ExampleView: View {
    @State var navigateTo: AnyView?
    var body: some View {
        NavigationView{
            VStack{
                Menu {
                    Button{
                        navigateTo = AnyView(EditProfileView())
                    }label:{
                        Text("dsfsaf")
                    }
                    Button(role: .destructive) {
                    } label: {
                        Text("удалить акк")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: 90))
                        .frame(width: 20, height: 30)
                        .foregroundColor(.black)
                }
                .menuStyle(DefaultMenuStyle())
                
                NavigationLink {
                    EditProfileView()
                } label: {
                    Text("редактировать")
                }
                .navigationTitle("View1")
            }
            
        }
    }
}


struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

