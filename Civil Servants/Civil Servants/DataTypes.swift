//
//  DataTypes.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/8/23.
//

import Foundation
struct DHM: Identifiable {
    var id = UUID()
    var area: String
    var name: String
    var affiliation: Affiliation
    var estimatedSalary: Int
    
}

enum Affiliation {
    case republican
    case democrat
    case independant
    case libertarian
}

struct Mayor: Identifiable {
    var id = UUID()
    var mayor: String
    var timeInOffice: String
    var estimatedSalary: Int
}
struct CityCouncilor: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var timeInOffice: String
    var estimatedSalary: Int
}

struct SheriffsOffice {
    var sheriff: String
    var underSheriff: String
    var estimatedSalary: Int
}

struct SchoolBoard {
    var meetings: [TimesAndLocations]
    var members: [Members]
}

struct TimesAndLocations {
    var date: String
    var location: String
    var time: String
}

struct Members {
    var name: String
    var estimatedSalary: Int
    var timeInOffice: Int
}

