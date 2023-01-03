//
//  ContentView.swift
//  swiftUiTutorial
//
//  Created by Islombek Gofurov on 14.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            LandmarkList()
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
