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
        
        let (data, response) = try await URLSession.shared.data(from: (urlComponents?.url!)!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserInformationError.couldNotGetInfo
        }
        
        let decoder = JSONDecoder()
        let user = try decoder.decode([User].self, from: data)
        
        return user
    }
    
    
//    func getUserInformation(inc: String) async throws -> User {
//
//        let session = URLSession.shared
//        var urlComponents = URLComponents(string: "https://randomuser.me")!
//
//        urlComponents.queryItems = [URLQueryItem(name: "inc", value: inc)]
//        //come back to this later
//
//        var request = URLRequest(url: urlComponents.url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        // Make the request
//        let (data, response) = try await session.data(for: request)
//
//        // Ensure we had a good response (status 200)
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//
//            throw UserInformationError.couldNotGetInfo}
//
//        let decoder = JSONDecoder()
//
//        let user = try decoder.decode(User.self, from: data)
//
//
//
//        return user
//    }
    
}
