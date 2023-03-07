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
    var name: String?
//    var address: String {
//        location.city + location.street
//    }
    var location: UserLocation
    var email: String?
    var login: String?
    var dob: UserDOB
    var phone: String?
    var id: UserID?
    var picture: String?
    var registered: UserRegistration
    var nationality: String?
//    var results: [User]
 
}

struct UserLocation: Codable {
    var street: LocationStreet
    var city: String
}

struct LocationStreet: Codable {
    var number: Int
    var name: String
}

struct Coordinates: Codable {
    var longitude: String
    var latitude: String
}
struct Timezone: Codable {
    var offset: String
    var description: String
}
struct UserDOB: Codable {
    var date: String
    var age: Int
}

struct UserRegistration: Codable {
    var date: String
    var age: Int
}

struct UserID: Codable {
    var name: String?
    var value: String?
}
