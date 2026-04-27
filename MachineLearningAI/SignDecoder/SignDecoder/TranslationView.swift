//
//  TranslationView.swift
//  SignDecoder
//
//  Created by 채유성 on 4/27/26.
//

import SwiftUI
import Translation // Translation machine learning framework

struct TranslationView: View {
    var text: String
    var isProcessing: Bool
    @State private var showingTranslation = false
    
    var body: some View {
        VStack {
            Text("Identified Text")
                .font(.subheadline.bold())
                .textCase(.uppercase)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            
            
            Text(text)
                .frame(maxWidth: .infinity,
                       maxHeight: 50,
                       alignment: .topLeading)
                .padding()
                .background(Color(white: 0.9))
                .overlay {
                    if isProcessing {
                        ProgressView()
                    }
                }
            // This modifier presents a sheet showing the original text along with its language, a selection of target languages, and the resulting text in the selected target language. (원본 텍스트와 함께 선택된 대상 언어, 선택된 대상 언어의 결과 텍스트를 보여주는 sheet를 제공한다)
            // It can also read the translated text aloud. (번역된 텍스트 결과를 소리 내어 읽을 수도 있음)
                .translationPresentation(isPresented: $showingTranslation, text: text)
            
            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8))
            }
            .disabled(text.isEmpty) // 텍스트가 없을 때는 버튼 비활성화
            .padding(.top)
        }
    }
}

#Preview {
    TranslationView(text: "Caution, falling rocks", isProcessing: false)
}

#Preview {
    TranslationView(text: "", isProcessing: true)
}
