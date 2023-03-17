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
}
struct CityCouncilor: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var timeInOffice: String
    var estimatedSalary: Int
}

struct SheriffsOffice: Identifiable {
    var id = UUID()
    var sheriff: String
    var estimatedSalary: Int
}

struct SchoolBoardMember: Identifiable {
    var id = UUID()
    var member: String
    var term: String
    
}

struct TimesAndLocationsForMeetings {
    var date: String
    var location: String
    var time: String
}