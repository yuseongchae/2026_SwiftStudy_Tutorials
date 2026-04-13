//
//  FriendDetail.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    
    // @Bindable property로 데이터를 읽고, 수정할 수 있다.
    // 이런식으로 friend를 @Bindable로 선언하면, 그 객체 자체뿐 아니라 내부 속성들까지 바인딩($) 형태로 UI에 전달할 수 있다.
    // 왜?
    // SwiftData의 model class는 기본적으로 Observable(관찰 가능)이기 때문.
    // 그래서
    // friend.name같은 속성이 바뀌면, SwiftUI가 자동으로 감지해 UI를 업데이트함.
    
    // 즉, @Bindable var friend: Friend 이 코드는 friend를 단순 값이 아니라, 양방향 바인딩 가능한 객체로 바꿔줌.
    @Bindable var friend: Friend
    
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    // 데이터 저장소로부터 movies를 view로 fetch해오기 위한 코드
    // to the view to fetch the movies from the data store
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        
        // Form view는 데이터를 보여주거나 수정할 때 사용할 수 있다.
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            // 이 상태로는 movie list는 볼 수 있으나, selected value를 바꿀순 없다
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("None") // 좋아하는 영화가 없을수도 있으니, "None" 선택지 추가
                    .tag(nil as Movie?)
                
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie) // .tag modifier를 통해 선택지별로 역할을 부여하여 selected value를 바꿀 수 있도록 한다
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // .confirmationAction은 의미 기반으로 위치를 지정하는 기능으로, SwiftUI가 대상 요소를 적절한 위치에 자동으로 배치한다.
            // (By specing the item's placement sementically, with .confirmationAction, you let SwiftUI choose the appropriate location for it)
            if isNew // 이미 존재하는 friend는 Save & Cancel 버튼이 필요하지 않기 때문에 if문으로 감싸서 New Friend일때만 이 두 버튼이 보이도록 설정
            {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss() // 삭제
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
