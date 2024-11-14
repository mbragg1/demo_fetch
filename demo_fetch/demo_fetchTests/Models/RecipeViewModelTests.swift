//
//  RecipeViewModelTests.swift
//  demo_fetchTests
//
//  Created by Mario Bragg on 11/14/24.
//

import XCTest
@testable import demo_fetch

@MainActor
final class RecipeViewModelTests: XCTestCase {

    var viewModel: RecipeViewModel!
    var mockDownloadUtils: MockDownloadUtils!
    
    override func setUp() {
        super.setUp()
        mockDownloadUtils = MockDownloadUtils()
        viewModel = RecipeViewModel(downloadUtils: mockDownloadUtils)
    }

    override func tearDown() {
        viewModel = nil
        mockDownloadUtils = nil
        super.tearDown()
    }

    func testLoadRecipesSuccess() async {
        let expectedRecipes = [mockRecipe1, mockRecipe2]
        mockDownloadUtils.mockRecipes = expectedRecipes

        await viewModel.loadRecipes()

        XCTAssertEqual(viewModel.recipes, expectedRecipes)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoadRecipesFailure() async {
        mockDownloadUtils.shouldThrowError = true

        await viewModel.loadRecipes()

        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertEqual(viewModel.errorMessage, "Failed to load recipes")
    }

    func testRefreshRecipes() async {
        let newRecipes = [mockRecipe1]
        mockDownloadUtils.mockRecipes = newRecipes

        await viewModel.refreshRecipes()

        XCTAssertEqual(viewModel.recipes, newRecipes)
        XCTAssertNil(viewModel.errorMessage)
    }
}
