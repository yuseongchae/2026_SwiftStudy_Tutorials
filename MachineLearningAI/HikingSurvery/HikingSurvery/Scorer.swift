//
//  Scorer.swift
//  HikingSurvery
//
//  Created by 채유성 on 4/22/26.
//

import Foundation
import NaturalLanguage

class Scorer {
    
    // NLTagger로 텍스트 분석 가능 (단어, 문장 구조, 감정 분석 등)
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String) -> Double {
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .paragraph, // longer form text를 사용할 예정이므로 .paragraph로 설정
            scheme: .sentimentScore,
            options: []) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue,
                   let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }
                return false
                
            }
        return sentimentScore
    }
}
