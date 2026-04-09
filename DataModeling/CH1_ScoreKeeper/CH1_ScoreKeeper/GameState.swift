//
//  GameState.swift
//  CH1_ScoreKeeper
//
//  Created by 채유성 on 4/7/26.
//

import Foundation

// enum : 서로 관련은 있지만 상호 배타적인(mutually exclusive) 값의 그룹에 대한 공통 유형읠 정의함.
// struct는 많은 인스턴스를 가질 수 있지만, enum은 정의된 값만 가능
enum GameState {
    case setup
    case playing
    case gameOver // enum 값은 case 키워드를 활용하여 선언
}
