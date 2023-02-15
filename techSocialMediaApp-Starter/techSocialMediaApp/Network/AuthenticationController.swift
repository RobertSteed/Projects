//
//  AuthenticationController.swift
//  techSocialMediaApp
//
//  Created by Brayden Lemke on 10/25/22.
//

import Foundation

class AuthenticationController {
    enum AuthError: Error, LocalizedError {
        case couldNotSignIn
    }
    

    /**
     Will make a request to authenticate the users credentials. If successful the User.current object will hold the signed in user.
     
     - Throws: If the user does not exist or if the API.url is invalid
     - Returns: A boolean depending on whether or not the operation was successful
     */
    func signIn(email: String, password: String) async throws -> Bool {
        
        struct CodableUser: Codable {
            var firstName: String
            var lastName: String
            var email: String
            var userUUID: UUID
            var secret: UUID
            var userName: String
        }
        
        // Initialize our session and request
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "\(API.url)/signIn")!)
        
        // Put the credentials in JSON format
        let credentials: [String: Any] = ["email": email, "password": password]
        
        // Add json data to the body of the request. Also clarify that this is a POST request
        request.httpBody = try JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make the request
        let (data, response) = try await session.data(for: request)
        
        // Ensure we had a good response (status 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw AuthError.couldNotSignIn
        }
        
        // Decode our response data to a usable User struct
        let decoder = JSONDecoder()
        let codableUser = try decoder.decode(CodableUser.self, from: data)
        let user = User(firstName: codableUser.firstName, lastName: codableUser.lastName, email: codableUser.email, userUUID: codableUser.userUUID, secret: codableUser.secret, userName: codableUser.userName, bio: "", techInterests: "")
        User.current = user

        return true
    }
}



