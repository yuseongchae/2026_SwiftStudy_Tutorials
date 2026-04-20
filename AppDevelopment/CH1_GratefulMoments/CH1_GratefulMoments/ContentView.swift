//
//  ContentView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/17/26.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill") {
                AchievementsView()
            }
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}

// 다크모드 프리뷰
#Preview ("Dark") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
