//
//  HexagonAccessoryView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/19/26.
//

import SwiftUI
struct HexagonAccessoryView: View {
    let moment: Moment
    let hexagonLayout: HexagonLayout
    
    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges[0])
            } else {
                MomentDetailView(moment: moment)
            }
            
        } label: {
            badgeView
        }
    }
    
    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .minimumScaleFactor(0.3) // 텍스트가 잘리지 않고 줄어들도록 함
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }.foregroundStyle(.gray)
            } else if let badge = badges.first {
                Image(badge.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }.offset(y: yOffset)
        
        
    }
    
    private var yOffset: CGFloat {
        let radius = hexagonLayout.size / 2
        // 30 degrees points to the top right corner of a hexagon
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }
    
    
    
    private var badges: [Badge] {
        moment.badges
    }
    
    private var size: CGFloat {
        hexagonLayout.size / 5
    }
}

#Preview("Single badge") {
    MomentHexagonView(moment: .sample, layout: .large)
        .sampleDataContainer()
}

#Preview("Multiple badge") {
    MomentHexagonView(moment: .imageSample, layout: .standard)
        .dynamicTypeSize(.large) // 텍스트가 넘치면 ... 으로 보임
        .sampleDataContainer()
}
