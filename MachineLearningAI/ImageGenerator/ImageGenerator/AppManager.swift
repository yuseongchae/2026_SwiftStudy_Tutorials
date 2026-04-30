//
//  AppManager.swift
//  ImageGenerator
//
//  Created by 채유성 on 4/30/26.
//

// ImageGenerator랑 로직 분리
// AppManager has higher-level responsibilities like determining which view will be displayed and responding to user actions.

import SwiftUI
import ImagePlayground


@Observable
class AppManager {
    let imageGenerator = ImageGenerator()
    var showPlayground = false
    var currentImage: NSImage?


    private(set) var error: Error?
    private(set) var isGenerating = false
    private var task: Task<Void, Never>?


    func generateImage() {
        error = nil
        isGenerating = true
        task?.cancel()


        task = Task {
            do {
                let generatedImage = try await imageGenerator.generate()
                currentImage = NSImage(cgImage: generatedImage.cgImage, size: .zero)
                isGenerating = false
            } catch {
                do {
                    try Task.checkCancellation()
                    self.error = error
                    isGenerating = false
                } catch {
                    // Task cancelled
                }
            }
        }
    }


    func reset() {
        imageGenerator.resetGenerator()
        currentImage = nil
        error = nil
        isGenerating = false
        task?.cancel()
    }
    
    
    func remove(ingredient: String) {
        if let index = imageGenerator.ingredients.firstIndex(of: ingredient) {
            imageGenerator.ingredients.remove(at: index)
        }
        generateImage()
    }
    
    
    func add(ingredient: String) {
        imageGenerator.ingredients.append(ingredient)
        generateImage()
    }
    
    
    var showKitchen: Bool {
        currentImage != nil || isGenerating
    }
}


extension View {
    func previewEnvironment(generateImage: Bool = true) -> some View {   // Preview에 이미지 생성 기능을 붙었는데, 필요하면 끄거나 두 개로 나눠서 사용할 수 있다
        let appManager = AppManager()
        appManager.imageGenerator.ingredients.append("Strawberry")
        return environment(appManager)
            .onAppear {
                if generateImage {
                    appManager.imageGenerator.style = .animation
                    appManager.generateImage()
                }
            }
    }
}
