## [Swift] App Development
### CH1. Views and data storage
1. Collect, model, and store data
https://developer.apple.com/tutorials/develop-in-swift/collect-model-and-store-data

- PhotosPicker
    - `loadTransferable`활용해 선택한 사진을 지원되는 형식으로 전송하기

- flatMap
    - Optional에 flatMap을 적용하면?
    : flatMap transforms the value inside an Optional and flattens nested Optional values.
    (Optional 안의 값을 반환하고, 중첩된 옵셔널을 평형하게 만든다)
    => 값이 있으면 변환 & Optional 중첩 제거
    
- SwiftUI view의 body에서 content 추출해서 사용하기
    - Extracting content into smaller functions makes it easier to read.
    (가독성 상승)
    
#### MomentEntryView
<img src="" width="20%">
