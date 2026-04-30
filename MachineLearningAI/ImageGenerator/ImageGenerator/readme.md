## [Swift] Machine learning and AI
### CH5. Image generation with Image Playground
https://developer.apple.com/tutorials/develop-in-swift/utilize-image-generation-features

### Check your Understanding
- `ImageCreator`
    - 추가 concept를 제공하면, 모델은 제공된 모든 concept를 받아서 이를 반영한 이미지를 생성한다. (각각 따로 생성되는게 아니라 하나의 이미지에 전부 섞여서 생성됨)

- `AsyncSequence`
    - `for await`를 사용해서 비동기적으로 값을 제공하는 시퀀스이다
    - 일반 sequence와 다르게 데이터가 나중에 도착하므로 기다리면서 처리된다 (값이 준비될 때마다 하나씩 꺼내서 쓰는 비동기 배열)

- `NSImage`는 macOS에서만 사용 가능하다.

### Reflect on the concepts
- Image Playground framework 사용해 코드로 이미지 생성하기
- asynchronous sequence를 사용해 이미지 생성 과정 처리하기
- 사용자 입력을 프레임워크에서 사용할 수 있는 데이터 형태로 변환하기
- 이미지 생성 과정에서 발생하는 오류 처리하기

### Topics and skills covered
- macOS 전용 SwiftUI 앱 만들기
- Image Playground로 image generating
- `ImagePlaygroundStyle`을 사용해 이미지 스타일 지정하기
- `ImagePlaygroundConcept`으로 생성 이미지 커스터마이징하기
- `ProgressView`로 로딩 진행 상태 표시하기
- `AsyncSequence`로 시간에 따라 시퀀스 반복 처리하기


### 이미지 생성해보기
#### 모두 선택하지 않으면 비활성화
<p>
  <img src="Disabled" width="70%">
</p>

#### 생성중일 때는 Progress 보여주기
<p>
  <img src="Generating" width="70%">
</p>

#### 샐러드 일러스트 생성
<p>
  <img src="Salad" width="70%">
<img src="Salad_illustration" width="70%">
</p>

#### 샌드위치 애니메이션 생성
<p>
  <img src="Sandwich" width="70%">
<img src="Sandwich_Animation" width="70%">
</p>

- 샌드위치에 재료 추가하기
  <img src="Add" width="70%">

- 이미지 공유하기
  <img src="Share" width="70%">
  
- 이미지 플레이그라운드 실행해보기
  <img src="ImagePlayground" width="70%">
  
#### 아이스크림 스케치 생성
<p>
  <img src="Icecreme" width="70%">
<img src="Icecreme_Sketch" width="70%">
</p>

