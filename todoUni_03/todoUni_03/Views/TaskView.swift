
import SwiftUI



struct TaskView: View {
    
    @Binding  var showTaskInfoView:Bool
    @State var item: Task
    @State var data: DataController
    var exampleDate:Date = .init()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.name ?? "nameError")
                    .foregroundColor(Color("light"))
                    .font(.system(size:25))
                    .fontWeight(.black)
                    .strikethrough(item.doneOrNot, color: Color("light"))
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                HStack{
                    Image(systemName: item.categoryImg ?? "graduationcap")
                    Text(item.categoryName ?? "University")
                }
                .foregroundColor(Color(self.item.priority ?? "dark"))
            }
            Spacer()
            VStack{
                Text(dateTostring())
                    .frame(width: 100, height: 50)
                    .border(Color("light"), width: 2)
                    .foregroundColor(Color("light"))
            }
        }
        .padding(.vertical, 0)
        .padding(.leading, 10)
    }
    func dateTostring() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: item.sheduleDate ?? exampleDate)
    }
}




//struct TaskView_Previews: PreviewProvider {
//        static var previews: some View {
//        TaskView()
//    }
//}


