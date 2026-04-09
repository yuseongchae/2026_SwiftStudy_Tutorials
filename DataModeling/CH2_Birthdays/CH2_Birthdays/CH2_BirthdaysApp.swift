//
//  CH2_BirthdaysApp.swift
//  CH2_Birthdays
//
//  Created by 채유성 on 4/9/26.
//

import SwiftUI
import SwiftData

@main
struct CH2_BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
                // container는 Friend 데이터가 저장되는 위치와 ContentView 사이에 위치한 번역기와 같은 역할을 한다
                .modelContainer(for: Friend.self) // Friend.self를 통해 type을 참조함
        }
    }
}
