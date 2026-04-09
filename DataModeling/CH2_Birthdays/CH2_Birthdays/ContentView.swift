//
//  ContentView.swift
//  CH2_Birthdays
//
//  Created by 채유성 on 4/9/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //    @State private var friends: [Friend] = [
    //        Friend(name: "Sonu", birthday: .now),
    //        Friend(name: "Erin", birthday: Date(timeIntervalSince1970: 0)) // Unix epoch time
    //    ]
    @Query(sort: \Friend.birthday) private var friends: [Friend] // 생일 오래된 순으로 정렬
    
    // modelContext는 view와 model container간의 연결을 제공하여 컨테이너의 item을 fetch, insert, and delete할 수 있또록 한다.
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack // 스크롤할 수 있음
        {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday { // 오늘 생일이면
                        Image(systemName: "birthday.cake") // 케이크 띄우기
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Text(friend.birthday, format: .dateTime.year().day().month(.wide)) // .wide로 줄임말 해제 (안쓰면 Apr, Jan 이렇게 나옴)
                }
            }.navigationTitle("Birthdays")
                .safeAreaInset(edge: .bottom) { // edge: .위치 형식으로 원하는 곳에 anchor할 수 있음
                    VStack(alignment: .center, spacing: 20) {
                        Text("New Birthday")
                            .font(.headline)
                        
                        // 날짜를 선택할 수 있는 DatePicker
                        DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                            TextField("Name", text: $newName)
                                .textFieldStyle(.roundedBorder)
                        }
                        Button("Save") {
                            let newFriend = Friend(name: newName, birthday: newDate)
                            context.insert(newFriend)
                            
                            newName = ""
                            newDate = .now
                        }
                        .bold()
                    }
                    .padding()
                    .background(.bar) // 시스템 툴바랑 같은 스타일의 배경 추가
                }            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true) // inMemort: true로 설정해 앱이 메모리에 있는 동안에만 데이터를 저장
}
