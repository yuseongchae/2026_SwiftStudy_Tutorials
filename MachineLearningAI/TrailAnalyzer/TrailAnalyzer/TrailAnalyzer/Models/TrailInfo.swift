//
//  TrailInfo.swift
//  TrailAnalyzer
//
//  Created by 채유성 on 4/29/26.
//

import Foundation


struct TrailInfo {
    var distance: Int?
    var elevation: Int?
    var terrain: Terrain?
    var wildlifeDangerLevel: Int = lowDanger
    
    
    static let lowDanger = 0
    static let highDanger = 1
    
    static var empty = TrailInfo()
    static var sample = TrailInfo(distance: 20, elevation: 200, terrain: .dirt, wildlifeDangerLevel: highDanger)
}
