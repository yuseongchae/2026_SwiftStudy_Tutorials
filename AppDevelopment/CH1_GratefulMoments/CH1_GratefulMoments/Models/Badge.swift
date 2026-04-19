//
//  Badge.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/19/26.
//

import Foundation
import SwiftData

/// Use  `timestamp` to determine if a badge is unlocked.
/// A `Moment` may be detailed but the timestamp stays.
/// Onde awarded, badges aren't relocked

@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    var timestamp: Date?
    
    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}
