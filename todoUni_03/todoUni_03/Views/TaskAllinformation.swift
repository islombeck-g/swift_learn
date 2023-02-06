

import SwiftUI



struct TaskAllinformation: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var item: Task
    @State var data: DataController
    var exampleDate:Date = .init()
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Text(item.name ?? "error CoreData")
                        .frame(width: 360, height: 60, alignment: .topLeading)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Group{
                        Text("Remind me:")
                            .frame(width: 360, height: 30, alignment: .topLeading)
                            .padding(.top, 10)
                            .padding(.leading, -15)
                        HStack{
                            Image(systemName: "alarm.waves.left.and.right")
                                .frame(width: 20, height: 20)
                                .padding(.top, 1)
                                .font(.title)
                                .padding(.leading, -30)
                            Text(dateTostring())
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("dark"), lineWidth: 5)
                                )
                                .padding(.leading, 15)
                                .font(.system(size: 20))
                                .foregroundColor(Color("dark"))
                        }
                    }.padding(.leading, 10)
                    Group{
                        HStack{
                            ZStack{
                                Text("Priority: ")
                                    .padding(.top, 10)
                                    .padding(.leading, -3)
                                    .frame(width: 360, height: 30, alignment: .topLeading)
                                ZStack{
                                    Circle()
                                        .fill(.yellow)
                                        .frame(width: 30, height: 30)
                                        .position(y:21)
                                        .padding(.leading, 13)
                                    Circle()
                                        .trim(from: 0, to: 1)
                                        .stroke(Color("dark"),style: StrokeStyle(lineWidth:4, lineCap: .round))
                                        .frame(width: 30, height: 30)
                                        .position(y:21)
                                        .padding(.leading, 13)
                                }
                                .padding(.leading, 100)
                            }
                        }
                    }
                    Group{
                        HStack{
                            ZStack{
                                Text("Tags: ")
                                    .frame(width: 360, height: 30, alignment: .topLeading)
                                    .padding(.leading, -6)
                                HStack{
                                    Image(systemName: item.categoryImg ?? "folder")
                                    Text(item.categoryName ?? "Project")
                                }
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("dark"), lineWidth: 5)
                                )
                                .font(.title3)
                                .foregroundColor(Color("dark"))
                                .position(x: 150, y: 25)
                            }
                        }
                    }
                    .padding(.top, 10)
                    Group{
                        Text("Note: ")
                            .frame(width: 360, height: 20, alignment: .topLeading)
                            .padding(.leading, -5)
                        Text(item.desc ?? "")
                            .padding()
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("dark"), lineWidth: 5)
                            )
                            .frame(width: 360, alignment: .topLeading)
                            .padding(.leading, 25)
                            .padding(.trailing, 25)
                            .padding(.top, -5)
                    }
                    .padding(.top, 10)
                }
                .foregroundColor(Color("light"))
                .padding(.top, 40)
            }
            VStack{
                Button{
                    data.taskJustDone(item: item)
                    self.presentationMode.wrappedValue.dismiss()
                }label:{
                    ZStack{
                        Rectangle()
                            .fill(Color("dark"))
                            .frame(width: 140, height: 60)
                            .modifier(RoundedCorner(corners: [.topLeft, .bottomLeft], radius: 15))
                        HStack{
                            Image(systemName: "checkmark.square")
                            Text("Done")
                        }.foregroundColor(Color.white)
                            .font(.title2)
                    }.frame(width: 140, height: 60)
                }
            } .position(x:330, y: 650)
                .navigationBarBackButtonHidden(true)
        } .toolbar{
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label:{
                Image(systemName: "xmark")
                    .foregroundColor(Color("dark"))
                    .padding(.trailing)
            }
        }
    }
    func dateTostring() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: item.sheduleDate ?? exampleDate)
    }
}



//
//struct TaskAllinformation_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskAllinformation()
//    }
//}
