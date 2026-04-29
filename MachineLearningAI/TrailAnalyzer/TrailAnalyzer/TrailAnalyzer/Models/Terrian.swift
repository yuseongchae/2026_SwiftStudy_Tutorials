//
//  Terrian.swift
//  TrailAnalyzer
//
//  Created by 채유성 on 4/29/26.
//

import Foundation


enum Terrain: String, Identifiable, CaseIterable {
    case paved
    case dirt
    case rocky
    case sandy


    var id: String {
        rawValue
    }
}
