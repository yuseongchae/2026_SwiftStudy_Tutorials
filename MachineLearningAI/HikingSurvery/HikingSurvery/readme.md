## [Swift] Machine learning and AI
### CH1. Natural language
Analyze sentiment in text
https://developer.apple.com/tutorials/develop-in-swift/welcome-to-machine-learning-and-ai

#### Check Your Understanding
- `NLTagger`는 텍스트를 자동으로 전부 분석하지 않기 때문에 직접 요청해야한다. (범위/단위/방식을 지정해야함)
- `enumerateTags` 를 활용해 각 문장의 범위를 구해서 넣고 분석할 수 있다.
- `Plottable` 프로토콜을 활용해 data를 chart 형태로 나타낼 수 있다.
- `GeometryReader`
    - 자신의 부모 컨테이너 안에서 어디에 있고 얼마나 큰지를 real-time으로 파악한다.
    - view가 배치(layout)되는 순간에 그 view의 위치, 크기 정보를 제공한다.ㅌ₩
    => 부모 view를 기준으로 내 크기/위치를 알려줘서 화면 크기가 바뀌어도 레이아웃을 유연하게 만들어준다.

#### Reflect on the concepts
- 여러 의견을 분석해 감성 점수 결정하기
- Natural Language framework를 사용해 긍정, 부정, 보통 정도를 숫자값에 할당하기
- chart를 사용해 점수를 가시화해 나타내기

#### Topics and skills covered
- `ScrollView`를 활용해 재사용 가능한 뷰(reusable views)들을 많이 표시하기
- `NLTagger`를 사용한 텍스트 감성(sentiment)분석
- 데이터를 차트로 시각화하여 표시
- `GeometryReader`를 사용하여 view의 실시간 레이아웃(크기, 위치) 정보 얻기

#### 기본 화면
<img src="DefaultContent" width="20%">

#### 값을 입력했을 때
<img src="EnterValue" width="20%">
- Scorer.swift 파일에서 `unit: .paragraph` 때문에 전체 텍스트를 하나의 덩어리로 보고 점수를 한개만 계산해 부정확한 결과가 나오는 상태
- `.sentimentScore`의 범위가 `-1.0 ~ 1.0`이어서 보수적으로 판단해 애매한 문장은 음수로 나오게 됨
- 문장 단위로 분석하고 평균을 구하는 방식으로 코드를 변경하거나, `threshold`를 조정하여 로직을 개선할 수 있음.
```
// 문장 단위로 분석하기
func score(_ text: String) -> Double {
    var scores: [Double] = []
    tagger.string = text
    
    tagger.enumerateTags(
        in: text.startIndex..<text.endIndex,
        unit: .sentence,
        scheme: .sentimentScore,
        options: []
    ) { sentimentTag, _ in
        if let value = sentimentTag?.rawValue,
           let score = Double(value) {
            scores.append(score)
        }
        return true
    }
    
    return scores.isEmpty ? 0 : scores.reduce(0, +) / Double(scores.count)
}

// threshold 조정하기
if score > 0.2 → Positive
if score < -0.2 → Negative
else → Neutral
```

#### 스크롤해서 데이터 확인하기
<img src="ScrollView" width="20%">
