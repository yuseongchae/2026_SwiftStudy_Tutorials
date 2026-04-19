//
//  DataContainer.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/17/26.
//

import SwiftData
import SwiftUI
import Observation

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer
    var badgeManager: BadgeManager
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        // in-memory model container
        let schema = Schema([
            Moment.self,
            Badge.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            badgeManager = BadgeManager(modelContainer: modelContainer) // BadgeManager는 DataContainer처럼 environment를 통해 공유될 수 있다. BadgeManager가 작동하려면 ModelContainer가 반드시 필요하므로(의존하므로, relies on), 이를 이미 가지고 있는 DataContainer의 종속성(Dependency)으로 포함시켜 관리하는 것이 효율적이다.
            
            // 이 method는 앱이 실행될때마다 작동한다 (runs)
            try badgeManager.loadBadgesIfNeeded()
            
            
            if includeSampleMoments {
                try loadSampleMoments()
            }
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func loadSampleMoments() throws { // to preload the ample data
        for moment in Moment.sampleData {
            context.insert(moment) // 주입
            try badgeManager.unlockBadges(newMoment: moment)
        }
    }
}

private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
