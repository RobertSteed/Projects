//
//  Players.swift
//  ScoreKeeper
//
//  Created by Robert Steed on 11/16/22.
//

import Foundation

struct Player: Comparable {
    var name: String
    var score: Int
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score < rhs.score
    }
}




