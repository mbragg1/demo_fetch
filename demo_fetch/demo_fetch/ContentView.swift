//
//  ContentView.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import SwiftUI
import asnycImage

struct ContentView: View {
    @StateObject private var viewModel: RecipeViewModel
    
    init(downloadUtils: DownloadUtilsProtocol = DownloadUtils()) {
        _viewModel = StateObject(wrappedValue: RecipeViewModel(downloadUtils: downloadUtils))
    }

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                HStack {
                    if let imageURL = recipe.photoURLSmall, !imageURL.isEmpty {
                        CAsyncImage(urlString: imageURL) { image in
                            image
                                .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        Image("default")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    VStack(alignment: .leading) {
                        Text(recipe.name).font(.headline)
                        Text(recipe.cuisine).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Recipes")
            .refreshable {
                await viewModel.refreshRecipes()
            }
            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil), actions: {
                Button("OK", role: .cancel) {}
            }, message: {
                Text(viewModel.errorMessage ?? "Unknown error")
            })
            .overlay {
                if viewModel.recipes.isEmpty {
                    VStack {
                       Image(systemName: "tray")
                           .font(.largeTitle)
                           .foregroundColor(.gray)
                       Text("No Recipes Available")
                           .font(.title2)
                           .foregroundColor(.gray)
                       Text("Pull down to refresh and try again.")
                           .font(.body)
                           .foregroundColor(.secondary)
                   }
                   .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView(downloadUtils: ContentViewDownloadUtils())
}
