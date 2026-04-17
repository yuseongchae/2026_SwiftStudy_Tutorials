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
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        // in-memory model container
        let schema = Schema([
            Moment.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            
            if includeSampleMoments {
                loadSampleMoments()
            }
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func loadSampleMoments() { // to preload the ample data
        for moment in Moment.sampleData {
            context.insert(moment) // 주입
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
