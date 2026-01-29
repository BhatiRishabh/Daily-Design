//
//  HomeViewModel.swift
//  Daily Design
//
//  Created by Rishabh Kumar on 26/01/26.
//


import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var images: [UnsplashImage] = []
    @Published var searchText: String = "Architecture"
    
    // Pagination helpers
    var page = 1
    
    let accessKey = Secrets.unsplashAccessKey
    
    func fetchImages() async {
        let urlString = "https://api.unsplash.com/search/photos?page=\(page)&query=\(searchText)&client_id=\(accessKey)&per_page=20"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
           
            let result = try JSONDecoder().decode(UnsplashSearchResult.self, from: data)
            
          
            self.images.append(contentsOf: result.results)
            self.page += 1 // Prepare for next page
            
        } catch {
            print("Error fetching images: \(error)")
        }
    }
    
    func updateTopic(topic: String) {
        self.searchText = topic
        self.images = []
        self.page = 1    // Reset page
        Task {
            await fetchImages()
        }
        
    }
}

struct UnsplashSearchResult: Codable {
    let results: [UnsplashImage]
}
