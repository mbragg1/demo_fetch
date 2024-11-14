//
//  DownloadUtils.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

protocol DownloadUtilsProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

struct DownloadUtils: DownloadUtilsProtocol {
    var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared as URLSessionProtocol) {
        self.session = session
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: Constants.API.allRecipesUrl) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await session.data(from: url, delegate: nil)
        let decodedData = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return decodedData.recipes
    }
}

