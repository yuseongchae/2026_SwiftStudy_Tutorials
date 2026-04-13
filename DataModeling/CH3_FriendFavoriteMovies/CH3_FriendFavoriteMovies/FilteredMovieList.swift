//
//  FilteredMovieList.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/13/26.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    
    // SearchText가 변할 때, SwiftUI는 FilteredMovieList를 업데이트
    // 그 과정에서 새로운 searchText값이 MovieList로 전달됨
    // => MovieList 내부에서 그 searchText를 기반으로 새 predicate + query를 생성
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
