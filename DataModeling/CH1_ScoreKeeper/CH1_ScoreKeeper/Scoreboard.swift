//
//  Scoreboard.swift
//  CH1_ScoreKeeper
//
//  Created by 채유성 on 4/7/26.
//

import Foundation

// 이 app의 logic을 담당하는 model : player들의 점수와 게임에서 현재 state를 추적함.
struct Scoreboard {
    
    var players: [Player] = [ // 프로토콜 활용
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]
    
    var state = GameState.setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin { // 가장 높은 점수가 승리하는 게임인 경우
            winningScore = Int.min // 승리 점수를 작은 숫자로 초기화
            for player in players{
                winningScore = max(player.score, winningScore)
            }
            
        } else { // 가장 낮은 점수가 승리하는 게임인 경우
            winningScore = Int.max // 승리 점수를 큰 숫자로 초기화
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        
        
        
        return players.filter { player in
            player.score == winningScore
        }
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}

