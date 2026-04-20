//
//  StreakView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/19/26.
//

import SwiftUI

struct StreakView: View {
    var numberOfDays: Int
    
    var body: some View {
        Hexagon(borderColor: .secondary) {
            VStack(spacing: 0) {
                Text("Streak \(Image(systemName: "flame.fill"))")
                    .foregroundStyle(.ember)
                
                Text(attributedText)
                    .multilineTextAlignment(.center)
            }
            .font(.callout)
        }
    }
    
    var attributedText: AttributedString {
        var attributedString = AttributedString(localized: "^[\(numberOfDays) \nDays](inflect: true)") // localization API 활용해서 자동으로 문법 교정
        if let range = attributedString.range(of: "\(numberOfDays)") {
            attributedString[range].font = .system(size: 70)
        }
        return attributedString
    }
}

#Preview {
    StreakView(numberOfDays: 0)
    StreakView(numberOfDays: 1)
    StreakView(numberOfDays: 23)
}

