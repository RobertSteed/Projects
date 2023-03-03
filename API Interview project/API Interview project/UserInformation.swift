//
//  UserInformation.swift
//  API Interview project
//
//  Created by Robert Steed on 3/1/23.
//

import Foundation
import UIKit


struct User: Decodable, Encodable {
    var gender: String
    var name: String
    var location: String
    var email: String
    var login: String
    var dob: String
    var phone: String
    var id: String
    var picture: String
    var registered: String
    var nationality: String
    
    static var current: User?
}
