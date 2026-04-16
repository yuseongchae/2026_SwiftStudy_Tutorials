// 게임 하는 방법

import SwiftUI

struct MessageView: View {
    // TODO: Different messages after winning or losing the game
    @Environment(Alphabetizer.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}

#Preview {
    MessageView()
        .environment(Alphabetizer())
}

#Preview {
    let alphabetizer = Alphabetizer()
    
    alphabetizer.message = .youWin
    return MessageView()
        .environment(alphabetizer)
}
