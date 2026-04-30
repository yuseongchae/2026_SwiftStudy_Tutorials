//
//  ImageGeneratorApp.swift
//  ImageGenerator
//
//  Created by 채유성 on 4/30/26.
//

import SwiftUI

@main
struct ImageGeneratorApp: App {
    @State var appManager = AppManager()
    
    var body: some Scene {
        Window("ImageGenerator", id: "main") { // 한 화면만 필요한 경우에는 WindowGroup 말고 Window를 쓰면 된다.
            ContentView()
                .environment(appManager)
        }
        .commands {
            CommandMenu("Actions") {
                ImageButtonsView(displayForMenu: true)
                                    .environment(appManager)
            }
        }
    }
}
