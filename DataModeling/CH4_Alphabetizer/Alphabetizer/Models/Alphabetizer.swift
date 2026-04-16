//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by 채유성 on 4/14/26.
//

// 이 게임의 brain(뇌, 로직)을 담당하는 파일
import Foundation
import Observation

// @Model이 기능을 추가하듯이, @Observable도 class에 추가 기능을 넣어준다.
// property 값이 바뀌면 SwiftUI View가 자동으로 업데이트된다.
// 즉, Observable은 상태 변경을 감지해서, UI를 자동으로 갱신해주는 장치.
@Observable
class Alphabetizer {
    private let tileCount = 3 // tile 개수
    private var vocab: Vocabulary
    
    var tiles = [Tile]() // player가 드래그하는 단어를 저장하는 배열
    var score = 0 // 점수
    var message: Message = .instructions 
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// Cheks if tiles are in alphabetical order : 이런식으로 function 위에 triple-slash comment를 다는 것을 documentation comment라고 한다
    /// Option + Click으로 Quick Help 확인 가능
    // tile들이 알파벳 순서를 따르는지 체크하는 함수
    
    // 코드를 작성할 때 전체를 한 번에 만드려고 하지 말고, 부분 단위로 나눠서 생각하고 구현하기
    func submit() {
        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        // Alternates true and false
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        
        // If alphabetized, increment the score
        if isAlphabetized
        {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            // TODO: Check if this tile is in the correct position
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        
        // Task로 감싸주기 (asynchronous code가 동작하게 하려면 Task로 감싸줘야함)
        Task { @MainActor in
        
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            if isAlphabetized {

                startNewGame()
            }
            
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            // Display instructions
            message = .instructions
        }
    }
    
    // MARK: private implementation
    
    /// Updates 'tiles' with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
    }
}
