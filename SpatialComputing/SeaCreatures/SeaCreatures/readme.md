## [Swift] Spatial computing
### CH3. Volumns in VisionOS
https://developer.apple.com/tutorials/develop-in-swift/create-3d-models-in-the-shared-space

### Check your Understanding
- `.windonStyle`에서 volume 만들기
    - `.volumetric`
- Reality Composer Pro
    - 3D models, sounds, materials를 만들고 프로젝트에 불러올 수 있다.
    - 내가 만든 3D 모델의 scale, position, rotation을 설정할 수 있다.
    
- visionOS에서 window를 만드는 방법
    - Define a `WindowGroup` App body with an `id` value that the `@Environment` can use when calling `openWindow`.
    - The `openWindow` function uses a String ID to open the View contained within the `WindowGroup` with the same id value.

### Reflect on the concepts
- Volume은 2D 윈도우와 완전한 3D immersive 사이의 중간 단계이다.
- App은 window + volume을 활용해 content를 보여주고,사용자가 Shared Space에서 자유롭게 배치할 수 있따.
- visionOS에서는 단순 UI가 아니라 깊이(depth), 제스처, 3D 요소를 포함한 공간 경험 설계를 하는 것이 핵심이다.

### Topics and skills covered
- Reality Composer Pro로 3D assets 관리하기
- `NavigationSplitView`로 인터페이스 설계하기
- `volumetric` window 생성해서 3D 콘텐츠 표시하기
- `@Environment`를 사용해 윈도우 열기
- 제스처를 추가해 volumetric 공간에서 모델 이동하기

### Reality Composer Pro에서 Scene 만들고 3D 모델 불러오기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/SpatialComputing/SeaCreatures/images/RealityComposer.png" width="70%">

### VisionPro에서 3D assets 띄우고 움직여보기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/SpatialComputing/SeaCreatures/images/Model.png" width="70%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/SpatialComputing/SeaCreatures/images/Move.png" width="70%">
