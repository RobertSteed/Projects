//
//  CommentsAndLikes.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/3/23.
//

import Foundation

struct Comments: Codable {
    var commentId: Int
    var body: String
    var userName: String
    var userId: String
    var createdDate: Date
}


