//
//  Posts.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/2/23.
//

import Foundation

struct Post: Codable {
    var postid: Int
    var title: String
    var body: String
    var authorUserName: String
    var authorUserId: String
    var likes: Int
    var userLiked: Bool
    var numComments: Int
    var createdDate: String
    
//    var stringInfo: String {
//        """
//\(title)
//   \(body)
//Created: \(createdDate)
//"""
//    }
        
        
        
        
    
}
