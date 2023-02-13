//
//  EOLHiearchy.swift
//  Life-FormSearch
//
//  Created by Robert Steed on 1/29/23.
//

import Foundation


struct Ancestor: Codable {
    var scientificName: String
    var taxonRank: String?
}

struct EOLHierarchy: Codable {
    var ancestors: [Ancestor]?
}
