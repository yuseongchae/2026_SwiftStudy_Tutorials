//
//  TunnelOfCirclesApp.swift
//  TunnelOfCircles
//
//  Created by 채유성 on 5/3/26.
//

import SwiftUI

@main
struct TunnelOfCirclesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize) // 창을 너무 작게 줄여서 콘텐츠가 안 보이는 현상 막기
    }
}
