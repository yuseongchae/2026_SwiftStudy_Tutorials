//
//  ContentView.swift
//  HikingSurvery
//
//  Created by 채유성 on 4/22/26.
//

import SwiftUI



struct ContentView: View {
    
    // @FocusState : 현재 어떤 view가 focus를 가지고 있는지 추적하고 변경하는 역할
    // TestField가 focus를 가지고 있는지 추적해서, 어떤 동작이 일어났을 때 키보드가 내려가게 함
    @FocusState private var textFieldIsFocused: Bool
    @State var responses: [Response] = []
    @State private var responseText = "" // to track input from people using the app
    var scorer = Scorer()
    
    // This function will take text, score it, and add it to the responses array.
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        
        // use the .insert method rather than .append so that the newest responses appear at the top of your ScrollView.
        // .append는 데이터를 배열 맨 뒤에 추가, .insert는 데이터를 배열 맨 앞에 추가
        responses.insert(response, at: 0)
    }
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView {
                ChartView(responses: responses)
                
                ForEach(responses) { response in
                    ResponseView(response: response)
                }
            }
            HStack {
                TextField("What do you think about hiking?", text: $responseText, axis: .vertical) // axis property를 사용하면 엔터(return)버튼이 텍스트 필드의 contents를 제출하는 용도로 작동하지 않도록 할 수 있다.
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                Button("Done") {
                    guard !responseText.isEmpty else { return }
                    saveResponse(text: responseText) // 빈 문자열인 상태에서 "Done" 버튼을 눌렀을 때 리스트에 추가되지 않도록 하기
                    responseText = "" // Clear the text entry field once a response has been saved. (저장되면 필드 초기화)
                    textFieldIsFocused = false // Done 버튼을 누르면 자동으로 키보드가 닫히도록 설정
                }
                .padding(.horizontal, 4)
            }
            .padding(.bottom, 8)
        }
        .onAppear{
            for response in Response.sampleResponses {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}


#Preview {
    ContentView()
}
