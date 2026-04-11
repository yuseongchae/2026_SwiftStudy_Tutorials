//
//  CH3_FriendFavoriteMoviesApp.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import SwiftUI
import SwiftData

@main
struct CH3_FriendFavoriteMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // .modelContainer를 통해 앱이 시뮬레이터에서 실제 데이터로 동작하도록 설정
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
