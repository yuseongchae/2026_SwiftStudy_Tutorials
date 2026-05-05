## [Swift] Spatial computing
### CH2. Ornaments and multiple windows
https://developer.apple.com/tutorials/develop-in-swift/present-common-controls-in-an-ornament

### Check your Understanding
- ornament
    - To provide access to commonly used controls without obstructing the contents of the main window.
    - Ornaments can contain any kind of SwiftUI View, though they are typically used for controls and not app content.
    
- visionOS에서 window를 만드는 방법
    - Define a `WindowGroup` App body with an `id` value that the `@Environment` can use when calling `openWindow`.
    - The `openWindow` function uses a String ID to open the View contained within the `WindowGroup` with the same id value.

### Reflect on the concepts
- Creating windows
- Ornaments
    - visionOS에만 있는(unique) window element
    - window와 평행한 평면에 떠있고, 살짝 앞(z축)에 위치함
    - window와 같이 이동함
    - window 내용이 스크롤돼도 ornament는 고정됨
    => 항상 접근 가능하지만 콘텐츠를 가리지 않는다.
    - 일반적으로 항상 보이게 유지하는것이 좋지만, 필요할 때만 일시적으로 숨기는 것도 가능하다.

### Topics and skills covered
- Using visionOS-specific window ornaments
- Configuring windows with Codable data
- Using @Environment to open new windows
- Using custom SwiftUI buttons to assign colors

#### visionOS 프로젝트에서 텍스트 입력해보기
- 짧은 글 입력
<img src="InputText" width="70%">

- 여러 줄 입력 (LabelView.swift 파일에서 TextField에 `axis: .vertical`modifier를 설정)
<img src="Multiline" width="70%">

#### Window 움직여보기
<img src="MoveWindow" width="70%">

#### ornemant 활용해 새 Window 만들어보기
<img src="LabelCreate" width="70%">
