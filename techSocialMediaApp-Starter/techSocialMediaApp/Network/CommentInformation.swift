//
//  CommentInformation.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import Foundation
class CommentInformation {
    enum CommentInformationError: Error, LocalizedError {
        case couldNotPostComment
        case couldNotGetComment
       
    }
    
    
    func userPostCommentInformation(userSecret: UUID, commentBody: String, postid: Int) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/createComment")!)
        
        // Put the credentials in JSON format
        let body: [String: Any] = ["userSecret": User.current?.secret.uuidString, "comment": ["userSecret": userSecret, "commentBody": commentBody, "postid": postid]]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw CommentInformationError.couldNotPostComment   }
    }
    
    
    
    func userGetCommentInformation(pageNumber: Int?, userSecret: UUID, postid: Int) async throws -> [Comments] {
        // Initialize our session and request
        let session = URLSession.shared
        var urlComponents = URLComponents(string: "\(API.url)/comments")!
        
        urlComponents.queryItems = [URLQueryItem(name: "userSecret", value: userSecret.description), URLQueryItem(name: "pageNumber", value: "0"), URLQueryItem(name: "postid", value: "0")]
        //come back to this later
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw CommentInformationError.couldNotGetComment  }
        let decoder = JSONDecoder()
        let user = try decoder.decode([Comments].self, from: data)
        
        
        
        return user
    }
    
    
}
    
    
    
  
