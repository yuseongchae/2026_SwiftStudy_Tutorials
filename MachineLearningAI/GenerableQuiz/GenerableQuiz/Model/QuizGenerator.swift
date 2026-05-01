//
//  QuizGenerator.swift
//  GenerableQuiz
//
//  Created by 채유성 on 5/1/26.
//

// 이 파일은 on-device 모델로부터 데이터를 받고, view에 분배한다.

import SwiftUI
import FoundationModels


@Observable
@MainActor
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?
    var isGenerating = false
    var error: Error?

    init(topic: String) {
        self.topic = topic
    }

    func generateQuiz() {
        run {
            // 1. LanguageModelSession 초기화가 async/throws가 아닐 경우 try await 제거
            let session = LanguageModelSession(instructions: "Create a quiz with the provided topic as the focus.")
            
            // 2. streamResponse 호출 시에도 정의에 따라 try await 조정
            let stream = session.streamResponse(to: self.topic, generating: Quiz.self)

            for try await partial in stream {
                self.quiz = partial.content
            }
        }
    }

    func regenerate(question: Question.PartiallyGenerated) {
        guard !isGenerating,
              var quiz = self.quiz,
              let questions = quiz.questions,
              let index = questions.firstIndex(where: { $0.id == question.id }) else {
            return
        }

        run {
            let session = LanguageModelSession(instructions: "Create a question focused on \(self.topic)")
            let existingQuestions = questions.compactMap { $0.text }.joined(separator: ", ")
            let prompt = "Avoid asking questions similar to these: \(existingQuestions)"
            
            let stream = session.streamResponse(to: prompt, generating: Question.self)

            for try await partial in stream {
                quiz.questions?[index] = partial.content
                self.quiz = quiz
            }
        }
    }

    func run(session: @escaping () async throws -> Void) {
        Task {
            isGenerating = true
            error = nil
            do {
                try await session()
            } catch {
                self.error = error
            }
            isGenerating = false
        }
    }
}
