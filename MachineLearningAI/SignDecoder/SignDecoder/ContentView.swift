//
//  ContentView.swift
//  SignDecoder
//
//  Created by 채유성 on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 50) {
                Text("Tap to select a sign to translate")
                    .font(.headline)
                
                ImageGalleryView()
                Spacer()
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
