//
//  Friend.swift
//  CH3_FriendFavoriteMovies
//
//  Created by 채유성 on 4/11/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie? // optional type - Friend model과 Movie model 사이에서 relationship을 만들 property
    // 이 관계는 다-대-일 (many-to-one) 관계 : 많은 friend가 같은 영화를 고를 수 있다
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Elena"),
        Friend(name: "Graham"),
        Friend(name: "Mayuri"),
        Friend(name: "Rich"),
        Friend(name: "Rody"),
    ]
}
