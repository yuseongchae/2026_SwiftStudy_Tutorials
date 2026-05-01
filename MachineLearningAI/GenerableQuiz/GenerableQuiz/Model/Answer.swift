//
//  Answer.swift
//  GenerableQuiz
//
//  Created by 채유성 on 5/1/26.
//

import Foundation
import FoundationModels


@Generable
struct Answer: Identifiable {
    let id = UUID()
    
    // 정확도를 올리기 위한 @Guide
    @Guide(description: "The display text of the answer.")
    let text: String
    
    
    @Guide(description: "Whether this is the correct answer or not.")
    let isCorrect: Bool
    
    
    @Guide(description: "Why is this answer correct or incorrect.")
    let explanation: String
}

extension Answer {
    static let correctAnswer = Answer(
        text: "This answer is correct.",
        isCorrect: true,
        explanation: "Explanation that this is right."
    )
    
    
    static let incorrectAnswer = Answer(
        text: "This answer is incorrect.",
        isCorrect: false,
        explanation: "Explanation that this is wrong."
    )
}
