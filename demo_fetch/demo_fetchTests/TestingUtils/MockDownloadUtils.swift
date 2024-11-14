//
//  MockDownloadUtils.swift
//  demo_fetchTests
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation
@testable import demo_fetch

let mockRecipe1 = Recipe(id: "1", cuisine: "Italian", name: "Spaghetti", photoURLLarge: nil, photoURLSmall: nil, sourceURL: nil, youtubeURL: nil)
let mockRecipe2 = Recipe(id: "2", cuisine: "Mexican", name: "Taco", photoURLLarge: nil, photoURLSmall: nil, sourceURL: nil, youtubeURL: nil)

class MockDownloadUtils: DownloadUtilsProtocol {
    var shouldThrowError = false
    var mockRecipes: [Recipe] = []

    func fetchRecipes() async throws -> [Recipe] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        }
        return mockRecipes
    }
}
