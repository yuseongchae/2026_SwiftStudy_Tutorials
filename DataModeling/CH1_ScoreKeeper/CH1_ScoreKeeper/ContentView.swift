//
//  ContentView.swift
//  CH1_ScoreKeeper
//
//  Created by 채유성 on 4/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    
    // private : capsulation (ContentView 안에서만 사용 가능)
    //    @State private var players: [String] = ["Elisha", "Andre", "Jasmine"] // 플레이어 상태 배열 선언 - 이 데이터는 변할 수 있는 데이터임
    //    @State private var scores: [Int] = [0, 0, 0] // 점수를 저장할 수 있는 배열
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints).disabled(scoreboard.state != .setup)
            
            // 0..<players.count로 payers 안에 있는 원소들을 count로 불러옴 -> 0부터 3까지
            // id: \.description : forEach는 각 항목을 구별할 고유한 ID가 필요함. 여기서는 index 숫자 자체의 설명(description)을  ...
            
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                
                ForEach($scoreboard.players) { $player in // 반복문으로 플레이어 추가 (
                    
                    // identifiable로 했기 때문에 더이상 ForEach에 id: 파라미터가 필요 없다
                    GridRow {
                        HStack
                        {
                            // 이긴 사람에게 왕관 씌워주기
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)// $로 바인딩 -> 단순히 값을 보여주는게 아니라, 사용자가 TextField에 글자를 입력하면 즉시 players 배열의 해당 인덱스 값이 업데이트됨
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden() // 중앙에 오도록
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") { // 데이터 추가 버튼
                scoreboard.players.append(Player(name: "", score: 0)) // 누르면 배열의 맨 끝에 빈 문자열 추가
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
