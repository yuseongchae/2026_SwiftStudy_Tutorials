import SwiftUI

struct ScoreView: View {
    @State private var score = 0
    @Environment(Alphabetizer.self) private var alphabetizer

    var body: some View {
        Text("Score: \(alphabetizer.score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
}

#Preview {
    ScoreView()
        .environment(Alphabetizer())
}
