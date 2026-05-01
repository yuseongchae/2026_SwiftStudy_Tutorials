//
//  Quiz.swift
//  GenerableQuiz
//
//  Created by 채유성 on 5/1/26.
//

import FoundationModels

// on-device 모델이 Quiz 타입을 반환하도록 지시함
// struct랑 enum에만 적용 가능

@Generable
struct Quiz {
    @Guide(description: "The questions associated with this quiz.")
    let questions: [Question]
}
