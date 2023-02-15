//
//  PostInformation.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import Foundation
class PostInformation {
    enum PostInformationError: Error, LocalizedError {
        case couldNotPostData
        case couldNotGetData
    }
    
    func userPostingInformation(title: String, body: String) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/createPost")!)
        
        // Put the credentials in JSON format
        let body: [String: Any] = ["userSecret": User.current?.secret.uuidString, "post": ["title": title, "body": body]]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PostInformationError.couldNotPostData    }
        
        
        //use response, get data and decode to Post
    }
    
    
    
    func userGetPostingInformation(pageNumber: Int?, userSecret: UUID) async throws -> [Post] {
        
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)/posts")!
        
        urlComponents.queryItems = [URLQueryItem(name: "userSecret", value: userSecret.description), URLQueryItem(name: "pageNumber", value: "0")]
        //come back to this later
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            
            throw PostInformationError.couldNotGetData   }
        
        let decoder = JSONDecoder()
        
        let user = try decoder.decode([Post].self, from: data)
        
        
        
        return user
    }
    
    
    func userGetPostingForUser(pageNumber: Int?, userSecret: UUID, userUUID: UUID) async throws -> [Post] {
        
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)/userPosts")!
        
        urlComponents.queryItems = [URLQueryItem(name: "userSecret", value: userSecret.description), URLQueryItem(name: "pageNumber", value: "0"), URLQueryItem(name: "userUUID", value: userUUID.description)]
        //come back to this later
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            
            throw PostInformationError.couldNotGetData   }
        
        let decoder = JSONDecoder()
        
        let user = try decoder.decode([Post].self, from: data)
        
        
        
        return user
    }
}
