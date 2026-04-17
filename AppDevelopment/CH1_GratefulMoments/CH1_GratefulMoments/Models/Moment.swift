//
//  Moment.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/17/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class Moment {
    var title: String
    var note: String
    var imageData: Data?
    var timestamp: Date
    
    init(title: String, note: String, imageData: Data? = nil, timestamp: Date = .now) {
        self.title = title
        self.note = note
        self.imageData = imageData
        self.timestamp = timestamp
    }
    
    var image: UIImage? { // Data를 UIImage로 변환
        imageData.flatMap { // flatMap 활용해 data가 있을때만 UIImage를 만들도록 함
            UIImage(data: $0)
        }
    }
}

extension Moment { // Moment에 기능 추가
    static let sample = sampleData[0]
    static let longTextSample = sampleData[1]
    static let imageSample = sampleData[4]
    
    static let sampleData = [
        Moment(
            title: "🍅🥳",
            note: "Picked my first homegrown tomato!"
        ),
        Moment(
            title: "Passed the test!",
            note: "The chem exam was tough, but I think I did well 🙌 I’m so glad I reached out to Guillermo and Lee for a study session. It really helped!",
            imageData: UIImage(named: "Study")?.pngData()
        ),
        Moment(
            title: "Down time",
            note: "So grateful for a relaxing evening after a busy week.",
            imageData: UIImage(named: "Relax")?.pngData()
        ),
        Moment(
            title: "Family ❤️",
            note: ""
        ),
        Moment(
            title: "Rock on!",
            note: "Went to a great concert with Blair 🎶",
            imageData: UIImage(named: "Concert")?.pngData() // 이미지 형식을 PNG로 변환
        )
    ]
    
}
