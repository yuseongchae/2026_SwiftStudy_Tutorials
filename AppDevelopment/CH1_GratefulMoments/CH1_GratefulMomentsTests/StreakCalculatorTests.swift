//
//  CH1_GratefulMomentsTests.swift
//  CH1_GratefulMomentsTests
//
//  Created by 채유성 on 4/21/26.
//

import Testing
@testable import CH1_GratefulMoments
import Foundation

struct StreakCalculatorTests {
    let streakCalculator = StreakCalculator()
    let now = Date.now
    
    struct Input {
        let expectedStreak: Int
        let days: [Int]
    }
    
    @Test("Streak calculations", arguments: [
        Input(expectedStreak: 0, days: []),


        Input(expectedStreak: 1, days: [0]),
        Input(expectedStreak: 1, days: [-1]),
        Input(expectedStreak: 0, days: [-2]),


        Input(expectedStreak: 1, days: [0, 0]),
        Input(expectedStreak: 1, days: [-1, -1]),
        Input(expectedStreak: 0, days: [-2, -2]),


        Input(expectedStreak: 3, days: [-2, -1, 0]),
        Input(expectedStreak: 2, days: [-3, -1, 0]),
        Input(expectedStreak: 3, days: [-3, -2, -1]),
        Input(expectedStreak: 2, days: [-4, -2, -1]),
    ])
    
    func testCalculations(input: Input) {
        let moments = input.days.map {
            let date = Calendar.current.date(byAdding: .day, value: $0, to:now)!
            return Moment(title: "", note: "", timestamp: date)
        }
        
        let streak = streakCalculator.calculateStreak(for: moments)
        #expect(streak == input.expectedStreak, "\(input.days)")
    }
    
}
