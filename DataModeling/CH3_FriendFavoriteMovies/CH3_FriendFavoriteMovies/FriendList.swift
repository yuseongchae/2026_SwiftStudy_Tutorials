//
//  FriendList.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    
    // A query fetches data from the model context and updates the view as it changes
    @Query(sort: \Friend.name) private var friends: [Friend] // to get an array of Friend instances
    
    // model context에 access하기 위한 @Environment property 선언
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        Text("Detail view for \(friend.name)")
                            .navigationTitle("Friend")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Friends")
            
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
