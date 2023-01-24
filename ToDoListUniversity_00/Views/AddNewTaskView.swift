
import SwiftUI


struct AddNewTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskNameEnter = ""
    @State private var descriptionEnter = ""
    var body: some View {
        VStack{
            Spacer()
            TextField(
                "Enter task name",
                text: $taskNameEnter
            )
            .padding(13)
            .foregroundColor(Color.white)
            .background(Color.gray)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 1.5)
            )
            .padding(.horizontal, 15)
            
            TextField("Description", text: $descriptionEnter)
                .padding(13)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1.5)
                )
                .padding(.horizontal, 15)
                .padding(.bottom, 50.0)
                
            HStack{
                Button{
                 //
                }label: {
                    Image(systemName: "stopwatch")
                }
                Spacer().frame(width:20)
                Button{
                    //
                }label: {
                    Image(systemName: "bookmark")
                }
                Spacer().frame(width:20)
                Button{
                    //
                }label: {
                    Image(systemName: "flag")
                }
                Spacer().frame(width: 170)
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "chevron.right.circle")
                }
                
            }.foregroundColor(Color.white)
            
        }.navigationTitle("Add Task")
            .background(Color.gray)
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
