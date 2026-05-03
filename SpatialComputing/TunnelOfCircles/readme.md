## [Swift] Spatial computing
### CH1. Windows in visionOS
https://developer.apple.com/tutorials/develop-in-swift/utilize-image-generation-features

### Check your Understanding
- `Grid`, `GridRow`
    - `Grid`로 전체 레이아웃을 구성하고, `GridRow`로 각 행을 정의하여 가로로 정렬된 여러 행을 만들 수 있다.
    
- `.background(.thickMaterial)
    - view의 배경을 thick material 스타일로 바꿀 수 있다. 
    
- `padding3D`
    - view와 배경 사이에 padding을 줄 수 있다. 
    - 예를 들어 `.padding3D(.back, 30)`이면 view의 뒤쪽에 30만큼의 공간을 추가할 수 있다.

### Reflect on the concepts
- `Windows`를 활용해 SwiftUI view와 컨트롤을 Shared Space에 배치할 수 있다.
- visionOS에서 depth(깊이)를 활용해 입체감 있는 UI를 구성한다.
    

### Topics and skills covered
- visionOS
    - 프로젝트 생성해보기
    - 프리뷰 확인 & 상호작용
    - 시뮬레이터 실행 & 테스트
- `.padding3D`로 view에 깊이 추가하기
- `Grid`, `GridRow`로 그리드 레이아웃 구성하기

#### visionOS 프로젝트에서 SwiftUI 띄워보기
<img src="Front" width="20%">

#### 깊이감 있는 UI 만들어보기
<img src="Side" width="20%">
