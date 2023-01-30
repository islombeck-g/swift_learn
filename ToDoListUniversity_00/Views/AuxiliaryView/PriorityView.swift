
import SwiftUI

struct PriorityView: View {
    @Binding var selectedNumber: Int
    @Binding var showPriorityView: Bool
    //@State private var selectedNumber = 5
    var body: some View {
        VStack{
            Text("Task Priority")
                .foregroundColor(Color.white)
                .font(.system(size: 22, design: .default))
            Rectangle()
                .fill(.white.opacity(0.7))
                .frame(height: 2)
                .frame(width: 315)
            
            LazyVGrid(columns: [GridItem(.fixed(100), alignment: .center), GridItem(.fixed(100), alignment: .center), GridItem(.fixed(100), alignment: .center)], spacing: 20) {
                ForEach(1...9, id: \.self) { number in
                    ZStack {
                        Rectangle()
                            .fill(self.selectedNumber == number ? Color.purple : Color.black)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .onTapGesture {
                                self.selectedNumber = number
                            }
                        VStack{
                            Image(systemName: "flag")
                            Text("\(number)")
                                
                        }
                        .foregroundColor(.white)
                        .font(.title)
                        
                    }
                }
//                Spacer()
                
//                HStack{
//                    Button{
//                        showPriorityView.toggle()
//                    }label: {
//                        Image(systemName: "chevron.right.circle")
//                            .foregroundColor(Color.white)
//                            .frame(width:150, height: 80)
//                            .background(Color.purple)
//                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//
//
//
//                    }
//                }
            }
            //.padding(.bottom, 100)
        }
        .frame(width: 360, height: 520)
        
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        
    }
}

//struct PriorityView_Previews: PreviewProvider {
//    static var previews: some View {
//        PriorityView()
//    }
//}
