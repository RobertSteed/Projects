//
//  LikesInformation.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/13/23.
//

import Foundation

class LikesInformation {
    
    enum LikeInformationError: Error, LocalizedError {
        case couldNotPostLike
        case couldNotGetLike
    }
    
    func userPostLikeInformation(userSecret: UUID, postid: Int) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/updateLikes")!)
        
        // Put the credentials in JSON format
        let body: [String: Any] = ["userSecret": User.current?.secret.uuidString, "comment": ["userSecret": userSecret, "postid": postid]]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw LikeInformationError.couldNotPostLike   }
    }
}

