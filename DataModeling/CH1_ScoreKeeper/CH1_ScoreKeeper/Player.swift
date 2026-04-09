//
//  Player.swift
//  CH1_ScoreKeeper
//
//  Created by 채유성 on 4/6/26.
//

import Foundation

struct Player: Identifiable { // Identifiable : protocol (규칙)
    let id = UUID() // UUID의 역할은? - player별로 고유한 ID 부여 (id 선언 안하면 에러 발생 - Type 'Player' does not conform to protocol 'Identifiable')
                    // Universally Unique IDentifier (전 우주에서 유일한 식별자 - 아주 복잡한 문자열 형태임)
                    // Identifiable protocol을 채택한다는 것 = 나(Player 구조체)를 사용할 때, 수많은 데이터 중에서 나를 딱 하나로 식별할 수 있는 고유한 ID를 반드시 제공하겠다.
                    // 즉, 이 프로토콜은 내부적으로 "id라는 이름의 프로퍼티를 반드시 가져야 한다"는 규칙을 가지고 있다.
                    // 따라서 id르 선언하지 않으면 에러가 발생하는 것이다.
                    
    var name: String
    var score: Int
}

// Equatable protocol 선언
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
    
}
