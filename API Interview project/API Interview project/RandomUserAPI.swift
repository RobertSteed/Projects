//
//  RandomUserAPI.swift
//  API Interview project
//
//  Created by Robert Steed on 2/28/23.
//

import Foundation
class UserInformationClass {
    
    enum UserInformationError: Error, LocalizedError {
        case couldNotGetInfo
    }
    
    func fetchItems(matching query: [String: String]) async throws -> [User] {
        var urlComponents = URLComponents(string: "\(API.url)")
        
        
        urlComponents?.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        print(urlComponents?.url)
        let (data, response) = try await URLSession.shared.data(from: (urlComponents?.url!)!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserInformationError.couldNotGetInfo
        }
        
        let decoder = JSONDecoder()
        print(urlComponents!.url!)
        print(String(data: data, encoding: .utf8)!)
        
        struct Result: Codable {
            var results: [User]
        }
        let result = try decoder.decode(Result.self, from: data)
        
        return result.results
    }
    
    
}
