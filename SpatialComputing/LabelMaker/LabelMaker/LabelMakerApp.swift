//
//  LabelMakerApp.swift
//  LabelMaker
//
//  Created by 채유성 on 5/5/26.
//

import SwiftUI

@main
struct LabelMakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowResizability(.contentSize)
        
        WindowGroup(for: Label.self) { $label in
            LabelView(label: $label)
                .disabled(true)
        } defaultValue: {
            Label(text: "", cornerRadius: 20)
        }
        .windowResizability(.contentSize)
        .windowStyle(.plain) // visionOS의 기본 스타일 지우기
    }
}
