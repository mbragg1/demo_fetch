//
//  Constants.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import Foundation

/*
    This constants file has sub-struct sections so it can be a container for all global constants.
    As the app gets built out other sections for things like images, fonts or colors can get added
 
 */

struct Constants {
    struct API {
        static let allRecipesUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        static let malformedDataUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        static let emptyDataUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
}

