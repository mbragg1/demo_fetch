//
//  ContentViewDownloadUtils.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation

class ContentViewDownloadUtils: DownloadUtilsProtocol {
    func fetchRecipes() async throws -> [Recipe] {
        let recipe1 = Recipe(id: "1", cuisine: "Italian", name: "Spaghetti", photoURLLarge: nil, photoURLSmall: nil, sourceURL: nil, youtubeURL: nil)
        let recipe2 = Recipe(id: "2", cuisine: "Mexican", name: "Taco", photoURLLarge: nil, photoURLSmall: nil, sourceURL: nil, youtubeURL: nil)
        return [recipe1, recipe2]
    }
}
 
