

import SwiftUI



struct TaskAllinformation: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var item: Task
    @State var data: DataController
    var exampleDate:Date = .init()
    // @Binding var showTaskInfoView: Bool
    var body: some View {
        ZStack{
            ScrollView{
                
                VStack{
                    Text(item.name ?? "error CoreData")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Group{
                        Text("Remind me:")
                            .padding(.top, 10)
                        HStack{
                            Image(systemName: "alarm.waves.left.and.right")
                                .padding(.top, 1)
                                .font(.title)
                            Text(dateTostring())
                                .padding()
                                .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("dark"), lineWidth: 5)
                            )
                                //.frame(width: 100, height: 50)
                                //.border(Color("light"), width: 2)
                                .font(.system(size: 20))
                                .foregroundColor(Color("dark"))
                            
                        }.padding(.leading, 250)
                    }
                    .padding(.leading, -90.0)
                    Group{
                        HStack{
                            Text("Priority: ")
                                .padding(.top, 10)
                            ZStack{
                                Circle()
                                    .fill(.yellow)
                                    .frame(width: 30, height: 30)
                                    .position(y:21)
                                    .padding(.leading, 13)
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(Color("dark"),style: StrokeStyle(lineWidth:4, lineCap: .round))
                                   // .fill(Color("dark"))
                                    .frame(width: 30, height: 30)
                                    .position(y:21)
                                    .padding(.leading, 13)
                                
                            }
                            
                        }
                    }
                    .padding(.leading, 180)
                    Group{
                        HStack{
                            Text("Tags: ")
                            
                            HStack{
                                Image(systemName: item.categoryImg ?? "folder")
                                Text(item.categoryName ?? "Project")
                            }
                            .padding()
                            .padding(.leading, -13.0)
                            
                            .frame(width: 170, height: 50)
                            .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("dark"), lineWidth: 5)
                        )
                            .font(.title3)
                            .foregroundColor(Color("dark"))
                        }
                        .padding(.leading, 70.0)
                    }
                    .padding(.top, 10)
                    .padding(.leading, -26.0)
                    
                    Group{
                        
                        Text("Note: ")
                        Text(item.desc ?? "")
                            .padding()
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("dark"), lineWidth: 5)
                            )
                        
                            .padding(.leading, 50)
                        
                            .padding(.trailing, 25)
                        
                        
                    }
                    .padding(.top, 10)
                    .padding(.leading, -85.0)
                    
                    
                }
                .foregroundColor(Color("light"))
                .padding(.leading, -150)
                .padding(.top, 40)
                
                
            }
            VStack{
                Button{
                    self.presentationMode.wrappedValue.dismiss()
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
                        
                        
                        
                    }.frame(width: 140, height: 60)
                    
                    
                    
                    
                }
                
            } .position(x:330, y: 700)
                .navigationBarBackButtonHidden(true)
        }
    }
    func dateTostring() -> String{
        
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: item.sheduleDate ?? exampleDate)
    }
}


//
//
//struct TaskAllinformation_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskAllinformation()
//    }
//}
