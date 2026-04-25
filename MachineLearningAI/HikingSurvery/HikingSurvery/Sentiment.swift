//
//  Sentiment.swift
//  HikingSurvery
//
//  Created by 채유성 on 4/24/26.
//

import Foundation
import SwiftUI
import Charts

enum Sentiment: String, Plottable { // Plottable protocol로 설정 -> Which lets you use Sentiment properties directly in a chart.
    case positive = "Positive"
    case negative = "Negative"
    case moderate = "Moderate"
    
    init (_ score: Double) {
        if score > 0.2 { // 점수에 따라 긍정, 부정, 보통
            self = .positive
        } else if score < -0.2 {
            self = .negative
        } else {
            self = .moderate
        }
    }
    
    // 아이콘
    var icon: String {
        switch self {
        case .positive:
            return "chevron.up.2"
        case .negative:
            return "chevron.down.2"
        case .moderate:
            return "minus"
        }
    }
    
    
    // 색
    var sentimentColor: Color {
        switch self {
        case .positive:
            return Color(red: 0.99, green: 0.49, blue: 0.00)
        case .negative:
            return Color(red: 0.08, green: 0.22, blue: 0.41)
        case .moderate:
            return Color(red: 0.00, green: 0.44, blue: 0.49)
        }
    }
}
