//
//  CH1_GratefulMomentsApp.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/17/26.
//

import SwiftUI
import SwiftData

@main
struct CH1_GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
