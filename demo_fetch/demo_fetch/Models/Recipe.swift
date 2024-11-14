//
//  Recipe.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation
// import SwiftUI

struct Recipe: Identifiable, Codable, Equatable {
    let id: String
    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let sourceURL: String?
    let youtubeURL: String?

    // Map 'uuid' to 'id' for SwiftUI Identifiable conformance
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

extension Recipe {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id &&
            lhs.cuisine == rhs.cuisine &&
            lhs.name == rhs.name &&
            lhs.photoURLLarge == rhs.photoURLLarge &&
            lhs.photoURLSmall == rhs.photoURLSmall &&
            lhs.sourceURL == rhs.sourceURL &&
            lhs.youtubeURL == rhs.youtubeURL
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
