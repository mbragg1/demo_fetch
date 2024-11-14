//
//  ConstantsTests.swift
//  demo_fetchTests
//
//  Created by Mario Bragg on 11/14/24.
//

import XCTest
@testable import demo_fetch

final class ConstantsTests: XCTestCase {
    
    func testAllRecipesUrl() {
        let expectedUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        XCTAssertEqual(Constants.API.allRecipesUrl, expectedUrl, "allRecipesUrl is incorrect")
    }
    
    func testMalformedDataUrl() {
        let expectedUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        XCTAssertEqual(Constants.API.malformedDataUrl, expectedUrl, "malformedDataUrl is incorrect")
    }
    
    func testEmptyDataUrl() {
        let expectedUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        XCTAssertEqual(Constants.API.emptyDataUrl, expectedUrl, "emptyDataUrl is incorrect")
    }
    
    func testUrlsAreNotEmpty() {
        XCTAssertFalse(Constants.API.allRecipesUrl.isEmpty, "allRecipesUrl should not be empty")
        XCTAssertFalse(Constants.API.malformedDataUrl.isEmpty, "malformedDataUrl should not be empty")
        XCTAssertFalse(Constants.API.emptyDataUrl.isEmpty, "emptyDataUrl should not be empty")
    }
}
