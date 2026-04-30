//
//  ImageGenerator.swift
//  ImageGenerator
//
//  Created by 채유성 on 4/30/26.
//

import SwiftUI
import ImagePlayground // It can generate images programmatically.


@Observable
class ImageGenerator {
    var recipe = ImageGenerator.defaultRecipe
    var style: ImagePlaygroundStyle?
    var ingredients: [String] = []
    
    // ImagePlayfroundConcept를 사용하면 이미지 생성 프로세스(과정)에 반영할 텍스트를 제공할 수 있게 해준다.
    // 예를 들어 "a cute dog wearing sunglases" 이런 텍스트를 넣으면 그 내용이 이미지 생성에 반영된다 (이미지를 만들 때 참고할 프롬포트를 넣을 수 있다고 보면 됨)
    var concepts: [ImagePlaygroundConcept] {
        var playgroundConcepts = [ImagePlaygroundConcept.text(recipe)]
        for ingredient in ingredients {
            playgroundConcepts.append(.text(ingredient))
        }
        return playgroundConcepts
    }
    
    
    func generate() async throws -> ImageCreator.CreatedImage {
        guard let style else { throw ImageCreator.Error.creationFailed }
        
        let imageCreator = try await ImageCreator() // Imagecreator : image를 만드는 Image Playground 컴포넌트
        let images = imageCreator.images(for: concepts, style: style, limit: 1)
        for try await image in images {
            return image
        }
        
        
        throw ImageCreator.Error.creationFailed
        
    }
    
    func resetGenerator() {
        recipe = ImageGenerator.defaultRecipe
        style = nil
        ingredients.removeAll()
    }
}


extension ImageGenerator {
    static let recipes = ["Salad", "Sandwich", "Ice Cream"]
    static let styles: [ImagePlaygroundStyle] = [
        .animation,
        .illustration,
        .sketch
    ]
    
    
    static let imageSize: CGFloat = 256
    private static let defaultRecipe = recipes[0]
}


