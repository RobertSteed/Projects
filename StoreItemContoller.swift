//
//  StoreItemContoller.swift
//  
//
//  Created by Robert Steed on 12/2/22.
//
import UIKit
import Foundation

enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}

enum PhotoInfoError: Error, LocalizedError {
    case itemNotFound
    case imageDataMissing
}

class StoreItemController {
    
    func fetchItems(matching query: [String: String]) async
    throws -> [StoreItem] {
     var urlComponents = URLComponents(string:
        "https://itunes.apple.com/search")!
     urlComponents.queryItems = query.map { URLQueryItem(name: $0.key,
        value: $0.value) }
     let (data, response) = try await URLSession.shared.data(from:
        urlComponents.url!)
         guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
         throw StoreItemError.itemsNotFound
     }
     let decoder = JSONDecoder()
     let searchResponse = try decoder.decode(SearchResponse.self,
        from: data)
     return searchResponse.results
    }
    
    
    func fetchImageURL(url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw PhotoInfoError.imageDataMissing
            }

            guard let image = UIImage(data: data) else {
                throw PhotoInfoError.imageDataMissing
            }

            return image
        } 
}

