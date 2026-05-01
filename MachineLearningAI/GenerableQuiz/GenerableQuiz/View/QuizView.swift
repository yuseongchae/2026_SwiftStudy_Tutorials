//
//  QuizView.swift
//  GenerableQuiz
//
//  Created by 채유성 on 5/1/26.
//

import SwiftUI


struct QuizView: View {
    @Environment(QuizGenerator.self) private var generator
    
    
    private var quizStack: some View {
        VStack(spacing: 16) {
            if let error = generator.error {
                Label(error.localizedDescription, systemImage: "xmark.circle")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.red)
                    .padding(.horizontal)
            }
            
            
            if let questions = generator.quiz?.questions {
                ForEach(questions) { question in
                    QuestionView(question: question)
                        .disabled(generator.isGenerating)
                        .padding(.vertical, 8)
                }
            }
            
            
            Button {
                generator.generateQuiz()
            } label: {
                Text("Start a new quiz")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(generator.isGenerating)
        }
        .navigationTitle(generator.topic)
        .padding()
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    quizStack
                }
            }
            .onAppear {
                generator.generateQuiz()
            }
        }
    }
}


#Preview {
    QuizView()
        .environment(QuizGenerator(topic: "Marine Life"))
}
