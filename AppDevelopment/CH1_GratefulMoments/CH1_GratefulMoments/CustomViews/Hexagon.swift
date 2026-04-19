//
//  Hexagon.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/18/26.
//

import SwiftUI

// Generic으로 Content 타입 선언 -> 내부에 어떤 모양의 View가 들어올지 모르니 미리 정하지 않기 위해 Genericd으로 선언 (일단은 Content type으로 설정)

// Generic이란?
// type을 미리 정하지 않고 사용할 때 결정하는 방식
struct Hexagon<Content: View>: View {
    private let borderWidth = 2.0
    var borderColor: Color = .ember
    //    var size: CGFloat = 350 // layout으로 대체
    var layout: HexagonLayout = .standard
    var moment: Moment? = nil
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask { // 앞에 있는 view를 뒤에 있는 view 모양대로 깎기
            Image(systemName: "hexagon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .fontWeight(.ultraLight)
        }
        .background { // 이미지에 테두리 추가
            Image(systemName: "hexagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .foregroundStyle(borderColor)
                .fontWeight(.ultraLight)
        }
        
        .frame(width: layout.size, height: layout.size)
        .overlay(alignment: .topTrailing) {
            if let moment {
                HexagonAccessoryView(moment: moment, hexagonLayout: layout)
            }
        }
    }
    
    
}

#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
