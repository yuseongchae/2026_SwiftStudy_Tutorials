## [Swift] Data modeling
### CH3. Navigation, editing, and relationships
1. Navigate sample data
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
    - `NavigationSplitView`로 화면을 나눠서 계층 구조를 표현할 수 있다.
    - 정보 hierachy(계층)를 관리할 수 있는 SwiftUI view이다.
    - `NavigationLink`와 함께 사용하여 사람들이 app의 content를 탐색하고, 구성 방식을 이해할 수 있도록 할 수 있다.
        
#### Topics and skills covered
- Sample data를 정의하고 SwiftUI preview에서 shared instance로 reuse하기
- `Manually creating`, `Schema`, `ModelConfiguration` and `ModelContainer`
- `NavigationSplitView`, `NavigationStack`, `NavigationLink`를 사용해 structured data를 navigation hieracheies(계층)에 표시하기 
    
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_1.imageset/FriendMovie_1.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_2.imageset/FriendMovie_2.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/FriendMovie_3.imageset/FriendMovie_3.png" width="20%">

2. Create, update, and delete data https://developer.apple.com/tutorials/develop-in-swift/create-update-and-delete-data
- Modal content
    - `.sheet` modifier로 Modal을 띄울 수 잇다.
    
- Component views
    - 개념
        - 재사용 가능한 화면 단위.
        - 본 예제에서는 `FriendDetail`과 `MovieDetail`을 재사용했다.
    - Reusable하고 Flexible한 component는 complex application을 만드는 Fundamental(핵심)이다.
    - 큰 앱을 기능이 명확한 작은 view로 나누면, 그 앱을 쉽게 이해할 수 있다.
    - View와 Model은 함께 동작한다.
        - Model : 데이터 제공 (provide data)
        - View : 데이터 표시 (display the data) + 사용자 입력에 따라 수정 (modify the data in response to input)
        
    ‼️Point
    - 하나의 View를 여러 상황에서 재사용하면 효율적이다.
    
#### Topics and skills covered
- Reusable detail views for both creating and editing data
- Modifying data models with @Bindable (@Bindable로 data model을 수정하기)
- `Form` container view : 데이터를 보여주고 수정할 수 있는 UI를 구조적으로 제공하는 컨테이너
- Displaying modal interfaces using `sheets`
- Optionals
- Custom view initializers

#### 메인 화면
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/New_Friend_Edit_Plus.imageset/New_Friend_Edit_Plus.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/New_Movie_Edit_Plus.imageset/New_Movie_Edit_Plus.png" width="20%">

#### Edit 버튼 눌렀을 때
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Edit.imageset/Friend_Edit.png" width="20%"><img src="(https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Edit.imageset/Movie_Edit.png" width="20%">

#### 새 친구/영화 추가하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Plus.imageset/Friend_Plus.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Plus_List.imageset/Friend_Plus_List.png" width="20%">
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Plus.imageset/Movie_Plus.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Plus_List.imageset/Movie_Plus_List.png" width="20%">

#### 친구/영화 삭제하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Delete_Friend_Swipe.imageset/Delete_Friend_Swipe.png" width="20%"><img src="(https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Delete_Movie_Swipe.imageset/Delete_Movie_Swipe.png" width="20%">
