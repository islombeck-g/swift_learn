//
//  swiftUiTutorialApp.swift
//  swiftUiTutorial
//
//  Created by Islombek Gofurov on 14.10.2022.
//

import SwiftUI

@main
struct swiftUiTutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
