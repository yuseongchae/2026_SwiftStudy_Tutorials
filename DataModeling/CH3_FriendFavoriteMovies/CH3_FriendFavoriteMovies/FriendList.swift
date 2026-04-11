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
    
    // ? : optional type - newFriend가 Friend의 instance일수도 있고(Friend 객체를 가질 수도 있고), nil일수도 있고.
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(friends) { friend in
                    NavigationLink(friend.name) {
                        FriendDetail(friend: friend)
                        
                    }
                }
                .onDelete(perform: deleteFriends(indexes:))
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            // sheet를 통해 modal을 띄울 수 있다.
            .sheet(item: $newFriend) { friend in
                NavigationStack { 
                    FriendDetail(friend: friend, isNew: true)
                }
                // 사용자가 sheet를 아래로 드래그해서 닫지 못하도록 설정 (사용자가 드래그로 sheet를 닫으면, 값을 저장하려는 것인지 취소하려는 것인지 구분할 수 없기 때문)
                .interactiveDismissDisabled()
            }
            
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 이 코드블록은 안쪽에서 바깥쪽 순서로 실행됨
    // 1. Friend instance를 만들고
    // 2. 그 instance를 insert()에 전달
    // => 함수 호출 시 argument(인자) 먼저 평가 -> 그 다음 함수 실행
    //    private func addFriend() {
    //        context.insert(Friend(name: "New friend"))
    //    }
    
    private func addFriend() {
        let newFriend = Friend(name: "") // local variable 선언 - @State로 선언된 같은 이름의 프로퍼티를 shadowing
        context.insert(newFriend)
        self.newFriend = newFriend // 따라서 view의 property를 쓰려면 self를 붙여야 함.
    }
    
    private func deleteFriends(indexes: IndexSet) {
        for index in indexes {
            context.delete(friends[index])
        }
    }
    
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}


