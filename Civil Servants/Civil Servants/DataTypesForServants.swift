//
//  DataTypes.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import Foundation
struct HM: Identifiable {
    var id = UUID()
    var area: String
    var name: String
    var affiliation: String
    var estimatedSalary: Int
    var publicPhoneNumber: String
    var picture: String
}

//enum Affiliation {
//    case republican
//    case democrat
//    case independant
//    case libertarian
//}


struct Mayor: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var timeInOffice: String
    var estimatedSalary: Int
    var publicPhoneNumber: String
    var picture: String
}
struct CityCouncilor: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var timeInOffice: String
    var estimatedSalary: Int
    var publicPhoneNumber: String
    var picture: String
}

struct SheriffsOffice: Identifiable {
    var id = UUID()
    var name: String
    var estimatedSalary: Int
    var publicPhoneNumber: String
    var picture: String
}

struct SchoolBoardMember: Identifiable {
    var id = UUID()
    var name: String
    var term: String
    var estimatedSalary: Int
    var publicPhoneNumber: String
    var picture: String
}

struct TimesAndLocationsForMeetings: Identifiable, Hashable {
    var id = UUID()
    var date: String
    var location: String
    var time: String
    var name: String
}

