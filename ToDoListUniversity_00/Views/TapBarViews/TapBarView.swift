
import SwiftUI

struct TapBarView: View {
    @Binding var wichView:Int
    @Binding var addTaskView:Bool
    var body: some View {
        ZStack{
            HStack{
                Button{
                    self.wichView = 0
                }label: {
                    VStack{
                        if self.wichView == 0{
                            Image(systemName: "house.fill")
                        }else{
                            Image(systemName: "house")
                        }
                        Text("Home")
                            .font(.system(size: 8))
                    }
                    
                }
                Spacer().frame(width:50)
                Button{
                    self.wichView = 1
                }label: {
                    VStack{
                        if self.wichView == 1{
                            Image(systemName: "calendar.badge.plus")
                        }else{
                            Image(systemName: "calendar")
                        }
                        Text("Calendar")
                            .font(.system(size:8))
                            .lineLimit(1)
                            .padding(.horizontal, -10.0)
                    }
                    
                }
                Spacer().frame(width: 120)
                Button{
                    self.wichView = 2
                }label: {
                    VStack{
                        if self.wichView == 2{
                            Image(systemName: "clock.fill")
                        }else{
                            Image(systemName: "clock")
                        }
                        Text("Focuse")
                            .font(.system(size: 8))
                    }
                    
                }
                Spacer().frame(width: 50)
                Button{
                    wichView = 3
                }label: {
                    VStack{
                        if wichView == 3{
                            Image(systemName: "person.fill")
                        }else{
                            Image(systemName: "person")
                        }
                        Text("profile")
                            .font(.system(size: 8))
                    }
                    
                }
            }
            .font(.system(size: 25))
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 8)
            .background(Color.gray)
            
            Button{
                self.addTaskView.toggle()
            }label: {
                Image(systemName: "plus")
                    .padding()
                    .font(.system(size: 25))
            }
            .background(Color.purple)
            .clipShape(Circle())
            .offset(y: -20)
            
        }
    }
}

//struct TapBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TapBarView(wichView: self.wichView)
//    }
//}
