//
//  UserInformation.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import Foundation
class UserInfomationClass   {
    enum UserInformationError: Error, LocalizedError {
        case couldNotUpdateInfo
        case couldNotRetrieveUserInfo
    }
    
    /**
     Will make a request to authenticate the users credentials. If successful the User.current object will hold the signed in user.
     
     - Throws: If the user does not exist or if the API.url is invalid
     - Returns: A boolean depending on whether or not the operation was successful
     */
    
    ///Post Update Profile
    func userPostInformation(userName: String, bio: String, techInterests: String) async throws {
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/updateProfile")!)
        
        // Put the credentials in JSON format
        let body: [String: Any] = ["userSecret": User.current?.secret.uuidString, "profile": ["userName": userName, "bio": bio, "techInterests" : techInterests]]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserInformationError.couldNotUpdateInfo    }
    }
    
    
    
    func userGetInformation(userUUID: UUID, userSecret: UUID) async throws -> User? {

        struct CodableGetUserInformation: Codable {
            var firstName: String
            var lastName: String
            var userUUID: UUID
            var userName: String
            var bio: String
            var techInterests: String
            var posts: [Post] = []
        }

        let session = URLSession.shared
        
        var urlComponents = URLComponents(string: "\(API.url)/userProfile")!
        
        urlComponents.queryItems = [URLQueryItem(name: "userSecret", value: userSecret.description), URLQueryItem(name: "userUUID", value: userUUID.description)]
        //come back to this later
        
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserInformationError.couldNotRetrieveUserInfo    }
        
        
        
        let decoder = JSONDecoder()
        let codableGetUserInformation = try decoder.decode(CodableGetUserInformation.self, from: data)
        let user = User(firstName: codableGetUserInformation.firstName, lastName: codableGetUserInformation.lastName, email: "", userUUID: codableGetUserInformation.userUUID, secret: UUID(), userName: codableGetUserInformation.userName, bio: codableGetUserInformation.bio, techInterests: codableGetUserInformation.techInterests)
//        User.current = user
     

        return user
    }
        
    }
    

