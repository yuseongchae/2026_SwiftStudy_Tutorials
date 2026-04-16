import Foundation

@Observable
class Tile: Identifiable {
    let id = UUID()

    // 짧고, 일반적이고, 어린이들에게 익숙한 단어
    var word: String
    
    // the location of the tile on screen
    var position: CGPoint = .zero
    // When flipped, show a checkmark instead of the word and icon
    var flipped = false

    init(word: String) {
        self.word = word
    }

    var icon: String {
        // FIXME: Lookup an icon matching the word
        Vocabulary.icons[word] ?? "🤷"
    }
}

extension Tile: Equatable {
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        lhs.id == rhs.id
    }
}
