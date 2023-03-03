//
//  CreateDeleteEditPosts.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/6/23.
//

import Foundation


class DeleteEditPosts {
    
    enum DeleteEdit: Error, LocalizedError {
        case couldNotUpdatePost
        case couldNotDeletePost
    }
    
    
    
    
    func userEditPost(postid: Int, title: String, body: String) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/editPost")!)
        
        // Put the credentials in JSON format
        let body: [String: Any] = ["userSecret": User.current?.secret.uuidString, "post": ["title": title, "postid": String(postid), "body" : body]]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DeleteEdit.couldNotUpdatePost }
    }
    
    
    
    func userDeletePost(postid: Int, userSecret: UUID) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        
        var urlComponents = URLComponents(string: "\(API.url)/post")!
        
        urlComponents.queryItems = [URLQueryItem(name: "userSecret", value: userSecret.description), URLQueryItem(name: "postid", value: String(postid))]
        //come back to this later
         
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DeleteEdit.couldNotDeletePost    }
    
        }
        
    }
    
