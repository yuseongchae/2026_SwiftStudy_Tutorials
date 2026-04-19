//
//  BadgeManager.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/19/26.
//

import Foundation
import SwiftData

class BadgeManager {
    private let modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    // badge 해금 함수 (when there is a new moment)
    func unlockBadges(newMoment: Moment) throws {
        let context = modelContainer.mainContext
        let moments = try context.fetch(FetchDescriptor<Moment>())
        
        // predicate를 사용해 Fetch the currently locked badges (to filter for badges that don't have a timestamp)
        let lockedBadges = try context.fetch(FetchDescriptor<Badge>(predicate: #Predicate{$0.timestamp == nil}))
        
        var newlyUnlocked: [Badge] = []
        
        
        for badge in lockedBadges {
            switch badge.details {
            case .firstEntry where moments.count >= 1,// Unlock the firstEntry badge when there is at least one moment
                    .fiveStars where moments.count >= 5,// Unlock the fiveStars badge when there are five or more monents
                    .shutterbug where moments.count(where: {$0.image != nil}) >= 3, // Unlock the shutterBug badge when there are three or more moments with images
                    .expressive where moments.count(where: {$0.image != nil && !$0.note.isEmpty }) >= 5, // Unlock the expressive badge when there are five or more moments that have an image and a note
                    .perfectTen where moments.count >= 10 && lockedBadges.count == 1: // Unlock the perfectTen badge when there are 10 or more moments and all other badges have been unlocked
                newlyUnlocked.append(badge)
            default:
                continue
            }
        }
        
        for badge in newlyUnlocked {
            badge.moment = newMoment
            badge.timestamp = newMoment.timestamp
        }
    }
    
    // Badge를 load하는 함수
    func loadBadgesIfNeeded() throws { // IfNeeded 접미사를 사용해 필요할때만 badge를 저장함을 나타내기
        let context = modelContainer.mainContext
        var fetchDescriptor = FetchDescriptor<Badge>()
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor) // FetchDescriptor lets you define the type of data to fetch, and it can filter, sort, and limit the number of results.
        
        // 뱃지가 저장되지 않은 경우
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases { // 모든 케이스에 대하여
                context.insert(Badge(details: details)) // 기본 데이터 채워주기
            }
        }
    }
}
