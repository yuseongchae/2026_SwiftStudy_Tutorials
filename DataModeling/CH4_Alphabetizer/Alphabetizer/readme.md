## [Swift] Data modeling
### CH4. Observation and sharable data models
Complete a game with logic
https://developer.apple.com/tutorials/develop-in-swift/complete-a-game-with-logic

#### Reflect on the concepts
‼️Point : View(화면)와 Model(데이터/로직)을 분리하라
- app의 data와 logic을 담는 type 만들기
- @Observable을 통해 View와 분리된 data model 만들기
- class 기반 model로 SwiftUI를 동작시키고 그것을 공유하는 방법
- data와 view를 나누면 app 구조를 이해하기 쉬워진다
```
// 전체 구조
Model (@Observable)
    ↓
Environment 공유
    ↓
View (UI)
```

#### Topics and skills
- Working in an existing codebase (이미 있는 코드를 읽고 수정하기)
- Changing the target device to iPad
- Annotating code wit comments, TODOs, FIXMs, MARKs, and documentation comments
    - // 일반 주석
    - TODO 해야 할 것
    - FIXME 수정사항
    - MARK 구역 나누기
    - /// documentation comments
- Quick Help로 코드 설명을 보고, Jump Bar로 파일/구조 이동하기
- @Observable
    - class의 값이 바뀌면 SwiftUI가 자동으로 감지해서 UI를 다시 그림
    - `.environment`를 같이 사용하면 주어진 범위 내에서 model을 공유할 수 있다. (environment를 넣은 View의 하위 트리 전체에서 사용 가능 - 따라서 보통 최상위에서 넣어서 앱 전체에서 사용 가능하도록 한다)
    
- Dictionary 사용해 값 조회하기
- Preview 커스터마이징해 미리보기용 데이터 따로 설정하기
- Concurrency function 사용해보기 - `try await Task.sleep(...)` // 비동기 대기
- `zip` 활용해 두 배열을 동시에 순회하기 (zip to simultaneously iterate over pairs of data)
- onChange로 값 변화 감지하고, 그 순간에 특정 코드를 실행한다.

### SwiftUI는 View와 Model을 분리하고, @Observable + Environment로 연결하는 구조가 핵심이다.
    
#### 기본 화면
<img src="Alphabetizer_1" width="20%">

#### 맞췄을 때
<img src="Alphabetizer_win" width="20%">

#### 틀렸을 때
<img src="Alphabetizer_almost" width="20%">

