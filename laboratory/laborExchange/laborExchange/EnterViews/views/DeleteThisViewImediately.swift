import SwiftUI

struct DropDownMenuView: View {
    let items: [String]
    let selectedItem: Binding<String>
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            HStack {
                Text(selectedItem.wrappedValue)
                    .foregroundColor(.black)
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
            .onTapGesture {
                isExpanded.toggle()
            }
            
            if isExpanded {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selectedItem.wrappedValue = item
                        isExpanded.toggle()
                    }) {
                        Text(item)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray, radius: 4, x: 0, y: 2)
            }
        }
    }
}

//
//struct someView: View {
//    @State private var selectedColor = "Red"
//    let colors = ["Red", "Green", "Blue"]
//    
//    var body: some View {
//        VStack {
//            Text("Selected color: \(selectedColor)")
//                .padding()
//            DropDownMenuView(items: colors, selectedItem: $selectedColor)
//                .padding()
//        }
//    }
//}


struct someView_Previews: PreviewProvider {
    static var previews: some View {
        someView()
    }
}


struct someView: View {

    @State private var selectedOption = "Option 1"

    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {

        Menu(selectedOption) {

            ForEach(options, id: \.self) { option in

                Button(action: {

                    self.selectedOption = option

                }) {

                    Text(option)

                }

            }

        }

        .foregroundColor(.blue)
    }

}
