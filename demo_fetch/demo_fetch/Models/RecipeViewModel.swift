//
//  RecipeViewModel.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?
    
    private let downloadUtils: DownloadUtilsProtocol
    
    init(downloadUtils: DownloadUtilsProtocol = DownloadUtils()) {
        self.downloadUtils = downloadUtils
        Task {
            await loadRecipes()
        }
    }

    func loadRecipes() async {
        do {
            recipes = try await downloadUtils.fetchRecipes()
        } catch {
            errorMessage = "Failed to load recipes"
        }
    }
    
    func refreshRecipes() async {
        await loadRecipes()
    }
}

