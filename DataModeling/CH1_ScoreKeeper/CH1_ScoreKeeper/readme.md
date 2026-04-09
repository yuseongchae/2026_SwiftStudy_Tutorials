## [Swift] Data modeling
### CH1. Custom types and Swift Testing
1. Model data with custom types
https://developer.apple.com/tutorials/develop-in-swift/model-data-with-custom-types
- `String`, `Int`, `Array` 데이터 타입 다루기
- 나만의 `struct`type을 defining해 app의 state를 data로 modeling
- Protocol Syntax 사용해보기
    - **❓Identifiable protocol이란**
    - Swift 및 SwiftUI에서 데이터 항목에 안정적이고 고유한 식별자(id)를 부여하는 프로토콜.
    - Hashable을 준수하는 id 프로퍼티를 필수로 구현해야 하며, 이를 통해 List나 ForEach에서 데이터를 고유하게 식별하고 UI 변경사항을 자동으로 반영함.
- UUID (Universally Unique IDentifier)
    - 전 우주에서 유일한 식별자. (아주 복잡한 문자열 형태임)
    - `UUID()`와 같은 형태로 호출할때마다 매번 완전히 새로운, 중복될 확률이 거의 0에 가까운 고유값 생성.
    - Identifiable protocol을 사용할 때 활용할 수 있음.
- `Grid`, `GridRow`를 활용한 grid 레이아웃 생성
<img src="https://github.com/yourseong/2026_SwiftStudy_Tutorials/blob/main/CH1_ScoreKeeper/Assets.xcassets/DataModeling.imageset/DataModeling.png?raw=true" width="20%">

2. Add functionality with Swift Testing
https://developer.apple.com/tutorials/develop-in-swift/add-functionality-with-swift-testing
- Unit test를 활용해 내 앱의 logic을 테스트해보며 의도대로 작동하는지 확인해보기
- Enum을 선언하고 사용해보기
- 앱의 logic을 포함하는 type 만들기
- .opacity를 사용해 view 숨기기
- .disabled를 사용해 control 비활성화
<img src="https://github.com/yourseong/2026_SwiftStudy_Tutorials/blob/main/CH1_ScoreKeeper/Assets.xcassets/SettingView.imageset/SettingView.png" width="20%">
<img src="https://github.com/yourseong/2026_SwiftStudy_Tutorials/blob/main/CH1_ScoreKeeper/Assets.xcassets/ScoreKeeper.imageset/ScoreKeeper.png" width="20%">
