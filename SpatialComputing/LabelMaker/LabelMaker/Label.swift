//
//  Label.swift
//  LabelMaker
//
//  Created by 채유성 on 5/5/26.
//

import Foundation
import SwiftUI

struct Label: Hashable, Codable { // Codable 프로토콜은 Encodable, Decodable 역할을 한번에 할 수 있다.
    var id = UUID()
    var text = ""
    var cornerRadius = 20.0
    var colorIndex = 0
    
    static let colors: [Color] = [.cyan, .green, .indigo]
    
    func selectedColor() -> Color {
        Label.colors[colorIndex]
    }
}
