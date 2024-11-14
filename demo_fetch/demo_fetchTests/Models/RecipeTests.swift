//
//  RecipeTests.swift
//  demo_fetchTests
//
//  Created by Mario Bragg on 11/14/24.
//

import XCTest
@testable import demo_fetch

final class RecipeTests: XCTestCase {

    func testRecipeDecoding() throws {

        let json = """
        {
            "recipes": [
                {
                    "uuid": "1234",
                    "cuisine": "Italian",
                    "name": "Spaghetti",
                    "photo_url_large": "https://example.com/large.jpg",
                    "photo_url_small": "https://example.com/small.jpg",
                    "source_url": "https://example.com/recipe",
                    "youtube_url": "https://youtube.com/watch"
                }
            ]
        }
        """

        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode(RecipeResponse.self, from: jsonData)

        XCTAssertEqual(recipeResponse.recipes.count, 1)

        let recipe = recipeResponse.recipes.first
        XCTAssertNotNil(recipe)
        XCTAssertEqual(recipe?.id, "1234")
        XCTAssertEqual(recipe?.cuisine, "Italian")
        XCTAssertEqual(recipe?.name, "Spaghetti")
        XCTAssertEqual(recipe?.photoURLLarge, "https://example.com/large.jpg")
        XCTAssertEqual(recipe?.photoURLSmall, "https://example.com/small.jpg")
        XCTAssertEqual(recipe?.sourceURL, "https://example.com/recipe")
        XCTAssertEqual(recipe?.youtubeURL, "https://youtube.com/watch")
    }

    func testRecipeDecodingWithMissingFields() throws {

        // Given
        let json = """
        {
            "recipes": [
                {
                    "uuid": "5678",
                    "cuisine": "Mexican",
                    "name": "Tacos"
                }
            ]
        }
        """

        // When
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        let recipeResponse = try decoder.decode(RecipeResponse.self, from: jsonData)

        // Then
        XCTAssertEqual(recipeResponse.recipes.count, 1)

        let recipe = recipeResponse.recipes.first
        XCTAssertNotNil(recipe)
        XCTAssertEqual(recipe?.id, "5678")
        XCTAssertEqual(recipe?.cuisine, "Mexican")
        XCTAssertEqual(recipe?.name, "Tacos")
        XCTAssertNil(recipe?.photoURLLarge)
        XCTAssertNil(recipe?.photoURLSmall)
        XCTAssertNil(recipe?.sourceURL)
        XCTAssertNil(recipe?.youtubeURL)
    }
}

