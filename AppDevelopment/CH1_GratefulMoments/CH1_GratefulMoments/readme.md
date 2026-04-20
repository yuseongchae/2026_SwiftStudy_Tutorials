## [Swift] App Development
### CH1. Views and data storage
1. Collect, model, and store data https://developer.apple.com/tutorials/develop-in-swift/collect-model-and-store-data

- PhotosPicker
- `import PhotosUI`로 불러와서 사용 가능
- `loadTransferable`활용해 선택한 사진을 지원되는 형식으로 전송할 수 있음

- flatMap
- Optional에 flatMap을 적용하면?
: flatMap transforms the value inside an Optional and flattens nested Optional values.
(Optional 안의 값을 반환하고, 중첩된 옵셔널을 평형하게 만든다)
=> 값이 있으면 변환 & Optional 중첩 제거

- SwiftUI view의 body에서 content 추출해서 사용하기
- Extracting content into smaller functions makes it easier to read.
(가독성 상승)

#### MomentEntryView
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/MomentEntryView.imageset/MomentEntryView.png" width="20%">

2. Use a custom layout view https://developer.apple.com/tutorials/develop-in-swift/use-a-custom-layout-view

#### Check your Understanding
- `@ViewBuilder` property
- closure를 사용해서 해당 property를 초기화하기 위해 사용한다. (View를 반환하는 closure를 property에 넘겨서 initialize할 수 있다)        
- `Mask`
- 다른 View의 투명도(alpha값)을 이용해서 현재 View를 보이게/가리게 하는 역할을 한다.
- `ContentUnavailableView`
- View에 표시할 데이터가 없을 때 활용한다.
- View 설계시 데이터가 없는 상황에서는 어떤 화면을 보여줄지에 대해서도 고려해야 한다.
- User가 무언가를 삭제하려는 action을 취하면, confirmation을 사용해 의도한 action인지 확인할 수 있게 해야한다.

#### Reflect on concepts
- SwiftData를 사용해 데이터 저장하기 (persistence)
- SwiftUI view를 활용해 구분감 있는 디자인 만들기

#### Topics and skills covered
- `PhotosPicker`로 갤러리에 접근하기
- `Transferable`로 데이터 옮기기
- `confirmationDialog`사용해 destructive actions에 safegard 부여하기
- `Mask`를 적용해 content를 모양에 맞추기(fit)

#### MomentsView
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/MomentsView.imageset/MomentsView.png" width="20%">

#### MomentsDetailView & confirmationDialog
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/confirmationDialog.imageset/confirmationDialog.png" width="20%">
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/MomentsDetailView.imageset/MomentsDetailView.png" width="20%">

#### PhotosPicker
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/PhotosPicker_1.imageset/PhotosPicker_1.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/PhotosPicker_2.imageset/PhotosPicker_2.png" width="20%">

### CH2. User experience features
Create an algorithm for badges https://developer.apple.com/tutorials/develop-in-swift/create-an-algorithm-for-badges

#### Check your Understanding
- purpose of `FetchDescriptor` in SwiftData
- To describe how data should be fetched from a data source
- `FetchDescriptor` describes the criteria(기준), the sort order, and any additional configuration to use when performing a fetch

- `compactMap`과 `map`의 차이점 (when applied to an Array)
- 우선 두 기능 모두 배열의 모든 요소를 반환한다.
- `compactMap`은 결과물 중에서 `Optional`(값이 없을 수도 있는 상태)인 것들을 버린다. (변환 결과가 nil(값 없음)이 나왔을 때 map은 그 nil을 그대로 결과 배열에 포함시키지만, compactMap은 제외함)
- `compactMap`은 `map`의 변환 과정을 거친 뒤 그 결과를 optional이 아닌(non-optional) 배열로 압축(compact)한다.

#### Topics and skills covered
1. 데이터 관리 및 쿼리 (SwiftData)
- SwiftData 사용해 앱의 데이터를 영구적으로 저장하고 관리하기
- `FetchDescriptor`를 사용해 SwiftUI View 안에서가 아닌 View 외부(일반 class나 매니저 객체 등)에서 SwiftData를 query 활용해 조회하고 가져오기
- `DateConponents` 활용해 특정 날짜를 계산하거나 비교하기

2. 사용자 경험 및 기능 구현
- Achievement 시스템 - 사용자의 특정 행동이나 milestone에 따라 보상이나 뱃지를 부여하는 로직 구현하기
- 문제 해결 알고리즘 - 특정 문제를 해결하기 위해 데이터를 처리하고 논리적인 흐름을 만드는 알고리즘 설계하기

3. SwiftUI Layout - Scrolling & Layout
- 복합 레이아웃 : Horizontal과 Vertical 스크롤 뷰를 조합해 복잡하고 유연한 화면 구성해보기
- `LazyVStack` : 화면에 보이는 부분만 메모리에 로드하여 많은 양의 데이터를 효율적으로 보여주기 (성능 최적화)
- 스크롤 세부 제어
- `.scrollIndicators(.hidden)` 사용해 화면에서 indicater(스크롤 바) 숨기기
- `.scrollClipDisabled()` 사용해 clipping 효과를 비활성화하여 스크롤 시 View가 화면 끝에서 잘리지 않고 자연스럽게 넘어가도록 하기

#### Hexagon 이미지와 Hexagon 이미지 디테일 View에 뱃지 달기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/HexagonAccessory.imageset/HexagonAccessory.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/MomentDetailView_Badge.imageset/MomentDetailView_Badge.png" width="20%">

#### MomentView with Streak & Moments가 없을 때
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/MomentsView_Streak.imageset/MomentsView_Streak.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/NoMoments.imageset/NoMoments.png" width="20%"><img src="Streak" width="20%">

#### Badges, Streak
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/UnlockedBadge.imageset/UnlockedBadge.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/LockedBadge.imageset/LockedBadge.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/Streak.imageset/Streak.png" width="20%">

#### Achievements
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/Achievements.imageset/Achievements.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch2/Achievements_scroll.imageset/Achievements_scroll.png" width="20%">

### CH3. App refinement
1. Add inclusive features https://developer.apple.com/tutorials/develop-in-swift/add-inclusive-features

#### Check Your Understanding 
- scalable content를 restrict하는법
`.dynamicTypeSize`를 활용한다.

- `locale`을 사용해야하는 이유
To display information that reflects people's language and region settings.

#### Dark모드 적용하고 Light모드와 함께 프리뷰에 띄우고 Dynamic하게 UI 변동하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch3/LightAndDark.imageset/LightAndDark.png" width="30%">

#### Localize text 
- 단수형/복수형 적용하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch3/Locale_Number.imageset/Locale_Number.png" width="30%">

- 다른 나라 언어 적용해보기 (Spanish)
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/AppDevelopment/CH1_GratefulMoments/CH1_GratefulMoments/Assets.xcassets/Images/Ch3/Locale_Language.imageset/Locale_Language.png" width="30%">
