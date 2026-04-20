//
//  BadgeDetailView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/19/26.
//

import SwiftUI

struct BadgeDetailView: View {
    var badge: Badge
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                Text(badge.details.title)
                    .font(.title.bold())
                Text(badge.details.congratulatoryMessage)
                    .font(.body)
                Spacer()
                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption2.bold())
                }
            }
            .padding()
            .frame(width: 320)
            .frame(minHeight: 410)
            .fixedSize()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .background(badge.details.color.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
        }
        .scrollBounceBehavior(.basedOnSize) // 쓸데없이 bouncing되는걸 방지하기 위함
        .defaultScrollAnchor(.center, for: .alignment) // ScrollView는 기본적으로 top에 anchor되므로 center로 맞춰줌

        
        
    }
}

#Preview {
    BadgeDetailView(badge: .sample)
}


// 스페인 기준으로 시간 보는 프리뷰
#Preview("Spanish language") {
    BadgeDetailView(badge: .sample)
        .environment(\.locale, Locale(identifier: "es"))
}
