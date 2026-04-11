## [Swift] Data modeling
### CH3. Navigation, editing, and relationships
Navigate sample data
https://developer.apple.com/tutorials/develop-in-swift/navigate-sample-data
- Sample data
    - @Query property는 하드코딩된 데이터를 넣을 수 없어서, SampleData(가짜 DB)를 만들어서 사용한다.
    - 개념 
        - 메모리에만 존재하는 DB로, 테스트용 데이터에 저장되며 Preview에서만 사용한다.
    - 생성 과정
        1. `ModelContainer(...)` 생성 (데이터 저장소, DB같은 개념이라고 보면 됨)
        2. Sample data 넣기 : `context.insert(Friend(...))`
        3. Preview에 주입하기 : `previewContainer(SampleData.shared.modelContainer)`
        - 이렇게 하면 @Query가 실제 DB처럼 동작하여 하드코딩 없이도 데이터를 표시할 수 있다.
        
    ‼️Point
    - @Query는 DB에서만 데이터를 가져올 수 있다 -> 테스트 단계에서는 가짜 데이터를 만들어서 넣는다.
    
- Navigation

    - `NavigationSplitView`
        - 정보 hierachy(계층)를 관리할 수 있는 SwiftUI view
        - `NavigationLink`와 함께 사용하여 사람들이 app의 content를 탐색하고, 구성 방식을 이해할 수 있도록 함.
        
#### Topics and skills covered
    - Sample data를 정의하고 SwiftUI preview에서 shared instance로 reuse하기
    - `Manually creating`, `Schema`, `ModelConfiguration` and `ModelContainer`
    - `NavigationSplitView`, `NavigationStack`, `NavigationLink`를 사용해 structured data를 navigation hieracheies(계층)에 표시하기 
    
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_1.imageset/FriendMovie_1.png" width="20%">
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_2.imageset/FriendMovie_2.png
" width="20%">
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_3.imageset/FriendMovie_3.png" width="20%">
