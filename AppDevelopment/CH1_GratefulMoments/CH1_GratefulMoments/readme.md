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
<img src="MomentsView" width="20%">

### MomentsDetailView & confirmationDialog
<img src="MomentsDetailView" width="20%"><img src="confirmationDialog" width="20%">

#### PhotosPicker
<img src="PhotosPicker_1" width="20%"><img src="PhotosPicker_2" width="20%">
