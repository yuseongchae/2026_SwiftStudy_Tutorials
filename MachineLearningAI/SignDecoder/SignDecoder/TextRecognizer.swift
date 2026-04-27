//
//  TextRecognizer.swift
//  SignDecoder
//
//  Created by 채유성 on 4/27/26.
//

import Foundation
import SwiftUI
// The Vision machine learning framework can identify a wide range of details in images and videos. You’ll use it to identify the text in your sign images.
import Vision

struct TextRecognizer {
    var recognizedText = ""
    var observations: [RecognizedTextObservation] = []
    
    init(imageResource: ImageResource) async {
        var request = RecognizeTextRequest()
        request.recognitionLevel = .accurate // The recognition level is a tradeoff between speed and accuracy.
        
        let image = UIImage(resource: imageResource)
        
        // Calling pngData() creates a copy of the image in the PNG data format.
        if let imageData = image.pngData(),
           let results = try? await request.perform(on: imageData) {
            observations = results
        }
        
        // AI가 이미지에서 텍스트를 인식할 때 완벽하게 확신하지 못하는 경우가 많음 -> 여러 후부(candidate)를 만들어냄
        // topCandidates(n)는 가능한 결과 후보들을 배열로 반환함
        // n == 가장 가능성 높은 것을 반환하는 개수. 1이면 1개만 반환.
        for observation in observations {
            let candidate = observation.topCandidates(1)
            
            if let observedText = candidate.first?.string {
                recognizedText += "\(observedText) "
            }
        }
    }
}
