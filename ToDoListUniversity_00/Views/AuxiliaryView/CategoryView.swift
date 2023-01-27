//
//  CategoryView.swift
//  ToDoListUniversity_00
//
//  Created by Islombek Gofurov on 27.01.2023.
//

import SwiftUI

struct CategoryView: View {
    @Binding var selectedNumber: String
    @Binding var showCategoryView: Bool
    //@State var selectedNumber:String = "graduationcap" selectedNumber: $category, showCategoryView: $showCategoryView
    var categories = [
        "University":"graduationcap",
        "Work":"briefcase",
        "Movie":"popcorn",
        "Music":"music.note.list",
        "Health":"bolt.heart",
        "Home":"house",
        "Sport":"dumbbell",
        "Project":"folder"
    ]
    //    var work = ["work":"briefcase"]
    //    var movie = ["movie":"popcorn"]
    //    var music = ["music":"music.note.list"]
    //    var health = ["health":"bolt.heart"]
    //    var home = ["home":"house"]
    //    var sport = ["sport":"dumbbell"]
    //    var currentProject = ["currentProject":"folder"]
    var body: some View {
        VStack{
            Text("Task Categories")
                .foregroundColor(Color.white)
                .font(.system(size: 22, design: .default))
                .padding(.top, 15)
            Rectangle()
                .fill(.white.opacity(0.7))
                .frame(height: 2)
                .frame(width: 315)
            
            
            Group{
                HStack{
                    
                    VStack{
                        Image(systemName: "\(categories["University"]!)")
                        
                            .font(.system(size: 22, design: .default))
                        Text("University")
                        
                    }
                    
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["University"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["University"]!
                    }
                    VStack{
                        Image(systemName: "\(categories["Work"]!)")
                        Text("Work")
                    }
                    
                    .foregroundColor(Color.white)
                    
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Work"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Work"]!
                    }
                    
                    VStack{
                        Image(systemName: "\(categories["Movie"]!)")
                        Text("Movie")
                    }
                    
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Movie"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Movie"]!
                    }
                }
                HStack{
                    VStack{
                        Image(systemName: "\(categories["Music"]!)")
                        Text("Music")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Music"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Music"]!
                    }
                    VStack{
                        Image(systemName: "\(categories["Health"]!)")
                        Text("Health")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Health"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Health"]!
                    }
                    VStack{
                        Image(systemName: "\(categories["Home"]!)")
                        Text("Home")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Home"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Home"]!
                    }
                }
                HStack{
                    VStack{
                        Image(systemName: "\(categories["Sport"]!)")
                        Text("Sport")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Sport"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Sport"]!
                    }
                    VStack{
                        Image(systemName: "\(categories["Project"]!)")
                        Text("Project")
                    }
                    
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .background(self.selectedNumber == categories["Project"] ? Color.purple : Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .onTapGesture {
                        self.selectedNumber = categories["Project"]!
                    }
                    
                }.padding(.leading, -105)
                
            }
            .padding(.top, 15)
            
            
            Spacer()
            
            HStack{
                Button{
                    self.showCategoryView.toggle()
                }label: {
                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(Color.white)
                        .frame(width:150, height: 80)
                        .background(Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                    
                    
                    
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: 360, height: 530)
        
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
    
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
//}

//
//var university = ["university":"graduationcap"]
//var work = ["work":"briefcase"]
//var movie = ["movie":"popcorn"]
//var music = ["music":"music.note.list"]
//var health = ["health":"bolt.heart"]
//var home = ["home":"house"]
//var sport = ["sport":"dumbbell"]
//var currentProject = ["currentProject":"folder"]
//var body: some View {
//    VStack{
//        VStack{
//            Image(systemName: ".\(String(describing: university["university"]))")
//            Text("saf")
//        }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
////            VStack{
////                Image(systemName: String)
////                Text()
////            }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
////            VStack{
////                Image(systemName: <#T##String#>)
////                Text()
////            }
//    }
//}
