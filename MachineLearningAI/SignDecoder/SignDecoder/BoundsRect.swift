//
//  BoundsRect.swift
//  SignDecoder
//
//  Created by 채유성 on 4/27/26.
//

import Foundation
import SwiftUI
import Vision


struct BoundsRect: Shape {
    let normalizedRect: NormalizedRect
    
    
    func path(in rect: CGRect) -> Path {
        let imageCoordinatesRect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(imageCoordinatesRect)
        
    }
}
