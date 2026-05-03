## [Swift] Machine learning and AI
### CH6. Intelligent features with Foundation Models
https://developer.apple.com/tutorials/develop-in-swift/generate-structured-content

### Check your Understanding
- `@Guide`
    - `LanguageModelSession`이 생성할 데이터의 형태나 의도를 구체적으로 알려주는 힌트 역할을 한다.
    
- 스트리밍으로 `@Generagble`데이터를 받을 때는 `.PartiallyGenerated`타입을 사용해야 한다.
    - 스트리밍은 결과가 한번에 완성되지 않고 부분적으로 생성되면서 전달되기 때문에, 각 프로퍼티가 아직 존재하지 않을 수 있으므로 Optional이다.
    
- `ScrollViewReader`
    - 코드로 스크롤을 제어할 수 있다.

- `AsyncSequence`
    - `for await`를 사용해서 비동기적으로 값을 제공하는 시퀀스이다
    - 일반 sequence와 다르게 데이터가 나중에 도착하므로 기다리면서 처리된다 (값이 준비될 때마다 하나씩 꺼내서 쓰는 비동기 배열)

- `NSImage`는 macOS에서만 사용 가능하다.

### Reflect on the concepts
- `@Generable`로 구조화된 데이터 정의
- `@Guide`로 각 프로퍼티의 생성 방향 구체화
- `LanguageModelSession`의 instructions, 초기 prompt, `@Guide`들이 하나의 프롬프트 체인처럼 연결되어 결과 형성
- response는 streaming으로 들어오기 때문에 완성되지 않은 데이터를 점진적으로 처리해야 함

### Topics and skills covered
- `@Generable` 매크로
- `@Guide`를 통한 생성 결과 제어
- `LanguageModelSession`과 스트리밍 처리
- `.PartiallyGenerated` 타입 사용
- `@escaping` 클로저 활용


#### 퀴즈 메인 페이지
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/GenerableQuiz/GenerableQuiz/Assets.xcassets/Quiz.imageset/Quiz.jpg" width="20%">

#### Apple Intelligence로 퀴즈 생성하고 풀어보기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/MachineLearningAI/GenerableQuiz/GenerableQuiz/Assets.xcassets/Main.imageset/Main.jpg" width="20%">
