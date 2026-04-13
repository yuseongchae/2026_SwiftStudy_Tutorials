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
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Edit.imageset/Friend_Edit.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Edit.imageset/Movie_Edit.png" width="20%">

#### 새 친구/영화 추가하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Plus.imageset/Friend_Plus.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Friend_Plus_List.imageset/Friend_Plus_List.png" width="20%">
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Plus.imageset/Movie_Plus.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Movie_Plus_List.imageset/Movie_Plus_List.png" width="20%">

#### 친구/영화 삭제하기
<img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Delete_Friend_Swipe.imageset/Delete_Friend_Swipe.png" width="20%"><img src="https://github.com/yuseongchae/2026_SwiftStudy_Tutorials/blob/main/DataModeling/CH3_FriendFavoriteMovies/CH3_FriendFavoriteMovies/Assets.xcassets/Delete_Movie_Swipe.imageset/Delete_Movie_Swipe.png" width="20%">

3. Work with relationships https://developer.apple.com/tutorials/develop-in-swift/work-with-relationships
- Relationships (관계)
- 모델 간 연결 구조 (데이터를 연결해서 기능과 의미를 만들어내는 구조)
- 관계가 없을 때 데이터 = 정보, 관계가 있을 때 데이터 = 맥락(Context)
- 1:1, 1:N, N:M 가능
- SwiftData에서는 type 기반으로 relationship을 자동으로 정의할 수 있다.

- Dynamic queries
- 사용자 입력에 따라 바뀌는 쿼리
```
// 항상 같은 기준 -> 고정된 결과
@Query(sort: \Movie.title) var movies: [Movie]

// 값이 바뀌면 필터 바뀌고, 정렬 바뀜 -> 결과도 바뀜
@Query(filter: predicate, sort: sortDescriptor)
```
    
    - 검색, 정렬, 필터 등 사용자 요구에 따라 데이터를 보여주는 방식을 변경하기 위해 사용.
    - `@Query(...)`는 보통 초기화 시점에 고정되기 때문에, 실행 중에 조건을 바꾸기 어려움
    => creating small, single-purpose views (View를 분리해 위 문제를 해결할 수 있음)
```
FilteredMovieList  (입력 담당) // 역할 : 사용자 입력 받기 & 상태 관리
↓
MovieList          (쿼리 담당) // 역할 : query 생성 & 데이터 가져오기
```
    - custom initializer로 View 생성 시점에 query를 동적으로 설정할 수 있다.
    - 앱의 전체 흐름
```
1. 사용자가 검색어 입력
2. @State 변경
3. View 재생성
4. MovieList init 
5. 새로운 prediacate 생성
6. Query 재실행
7. UI 업데이트
```
    - Dynamic Query의 구성 요소 : predicate(필터) & sort descriptor (정렬)
    - Dynamic Query는 입력 View와 데이터 View 분리하고, `init`에서 `@Query`를 동적으로 생성해서 구현한다.
    
    #### 리스트에 아무것도 없을 때
    <img src="Add_Friends" width="20%"><img src="Add_Movies" width="20%">
    
    #### Picker로 좋아하는 영화 선택하고 Movie에서 확인하기
    <img src="Friend_Picker" width="20%"><img src="Movie_Favorited" width="20%">
