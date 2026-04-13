//
//  MovieList.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    
    init(titleFilter: String = "") {
        // Predicate : A logical condition used to test a set of input values for searching or filtering
        // Struct 이지만, 실제로는 데이터 필터링을 위한 조건 표현식으로 사용됨.
        // Predicate는 aribiraty(임의의) code를 포함할 수 없다.
        let predicate = #Predicate<Movie> { movie in
            // Include the movie if the title filter is empty or if the movie's title contains the text in the filter
            // title filter가 비었거나, movie의 title이 filter 안에 포함될 경우
            // localizedStandardContains() : 문자열 검색을 할 때 대소문자 + 언어 특성까지 고려해서 비교해주는 함수
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        // @State, @Bindaable, @Environment work in a similar way to @Query
        _movies = Query(filter: predicate, sort: \Movie.title)
        
    }
    
    var body: some View {
        
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    .onDelete(perform: deleteMovies(indexes:)) // swipe-to-delete 액션 실행 가능 (스와이프 제스처를 통해 삭제)
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton() // View를 Edit 모드로 전환시킴
            }
        }
        .sheet(item: $newMovie)  { movie in
            // NavigationStack으로 후속 탐색에서 view를 설정할 수 있다
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
        
    }
    
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    // 삭제 요청이 들어오면 (deleteMovies를 호출하면)
    // for-in을 통해 index를 하나씩 꺼내서
    // 해당하는 요소를 삭제 : context.delete()
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
