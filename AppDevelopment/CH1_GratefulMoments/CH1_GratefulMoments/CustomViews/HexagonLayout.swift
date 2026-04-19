//
//  HexagonLayout.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/18/26.
//

// This file will provide sizing information for the Hexagon to support different layouts.
import Foundation
import SwiftUI

enum HexagonLayout {
    case standard
    case large
    
    var size: CGFloat {
        switch self {
        case .standard: // 표준 크기
            return 200.0
        case .large: // 큰 사이즈
            return 350.0
        }
    }
    
    var timestampBottomPadding: CGFloat {
        0.08
    }
    
    var textBottomPadding: CGFloat {
        0.25
    }
    
    // view가 flexible size & irregular shape를 포함하므로, padding size를 view에 맞게 조절되도록 계산식 설정해 masking area안에 들어오도록 하기
    var timestampHeight: CGFloat {
        size * (textBottomPadding - timestampBottomPadding)
    }
    
    var titleFont: Font {
        switch self {
        case .standard:
            return .headline
        case .large:
            return .title.bold()
        }
    }
    
    var bodyFont: Font {
        switch self {
        case .standard:
            return .caption2
        case .large:
            return .body
        }
    }
    
}
