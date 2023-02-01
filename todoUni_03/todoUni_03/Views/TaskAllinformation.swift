

import SwiftUI



struct TaskAllinformation: View {
   // var item: TodoItem
    @Binding var showTaskInfoView: Bool
    var body: some View {
        ZStack{
            ScrollView{
                
                VStack{
                    Text("Task name")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Group{
                        Text("Remind me:")
                            .padding(.top, 10)
                        HStack{
                            Image(systemName: "alarm.waves.left.and.right")
                                .padding(.top, 1)
                                .font(.title)
                            
                            
                        }
                    }
                    .padding(.leading, -90.0)
                    Group{
                        HStack{
                            Text("Priority: ")
                                .padding(.top, 10)
                            Circle()
                                .fill(.yellow)
                                .frame(width: 30, height: 30)
                                .position(y:21)
                                .padding(.leading, 10)
                            
                        }
                    }
                    .padding(.leading, 180)
                    Group{
                        HStack{
                            Text("Tags: ")
                            
                            HStack{
                                Image(systemName: "folder")
                                Text("Project")
                            }
                            .frame(width: 100, height: 50)
                            .font(.title3)
                            .foregroundColor(Color("dark"))
                        }
                    }
                    .padding(.top, 10)
                    .padding(.leading, -26.0)
                    
                    Group{
                        
                        Text("Note: ")
                        Text("moewfdsfsdkfnadskjhfbasklfjvbsadjkfhvdsjfhvasdjfhavsdjfhavsdjfkhvasdfjkhvdsjfavsdhmoewfdsfsdkfnadskjhfbasklfjvbsadjkfhvdsjfhvasdjfhavsdjfhavsdjfkhvasdfjkhvdsjfavsdhjfvdsjfvds")
                            .padding()
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("dark"), lineWidth: 5)
                            )
                        
                            .padding(.leading, 270)
                        
                            .padding(.trailing, 25)
                        
                        
                    }
                    .padding(.top, 10)
                    .padding(.leading, -90.0)
                    
                    
                }
                .foregroundColor(Color("light"))
                .padding(.leading, -150)
                .padding(.top, 40)
                
               
            }
            VStack{
                Button{
                    showTaskInfoView.toggle()
                }label:{
                    ZStack{
                        Rectangle()
                            .fill(Color("dark"))
                            .frame(width: 140, height: 60)
                            .modifier(RoundedCorner(corners: [.topLeft, .bottomLeft], radius: 15))
                        HStack{
                            Image(systemName: "return.left")
                            Text("Back")
                        }.foregroundColor(Color.white)
                            .font(.title2)
                        
                        
                        
                    }.position(x:330, y: 700)

                    
                }
                
            }
            
        }
    }
}


//
//struct TaskAllinformation_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskAllinformation()
//    }
//}
