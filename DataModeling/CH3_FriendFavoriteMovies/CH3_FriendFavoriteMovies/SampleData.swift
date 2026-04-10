//
//  SampleData.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    
    // static 키워드는 shared property를 individual instance가 아닌 class 자체에 속하는 것으로 정의한다.
    // 이 property에 access하고싶으면 SampleData.shared라고 쓰면 됨.
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    
    // Swift concurrency: swift는 actor를 사용해 동시에 실행되는 코드를 관리한다.
    var context: ModelContext {
        modelContainer.mainContext // 이렇게 쓰면 mainContext는 자동으로 main thread(=MainActor)에 묶임
        // 그러나 백그라운드에서 접근할 때 (context.insert(...) 같은 형식), 다른 스레드에서 접근하는 것이므로 충돌할 수 있음
        // -> @MainActor or custom actor 필요
    }
    
    private init() {
        let schema = Schema([ // Schema : model의 schema는 코드에서 정의한 class를 데이터 저장소의 데이터와 연결하는데 도움을 줌
            Friend.self,
            Movie.self,
                            ])
        
        // preview에 persisted data를 사용해서는 안된다.
        // Xcode는 view 코드를 작성할 때 preview를 자주 다시 로드하며, preview를 새로고침할 때마다 깨끗한 sample data를 설정하는 것이 가장 좋다.
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        // do-try-catch로 에러 핸들링
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData() // modelContainer와 달리 doesn't have any cases expected to fail이므로 try를 쓸 필요가 없다.
            
            try context.save()
        } catch {
            // initializer가 modelContainer값을 설정하지 않고 종료되지 않도록 guarantee하기 위한 장치
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        
        // for-in 반복문은 SwiftUI에 있는 ForEach view랑 비슷하다
        for friend in Friend.sampleData {
            context.insert(friend)
            
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
    
    
}
