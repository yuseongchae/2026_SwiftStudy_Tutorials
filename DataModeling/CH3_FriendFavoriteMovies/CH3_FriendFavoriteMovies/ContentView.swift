//
//  ContentView.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView { // TabView안에는
            Tab("Friends", systemImage: "person.and.person") { // Tab이 들어감
                FriendList()
            }
            
            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
