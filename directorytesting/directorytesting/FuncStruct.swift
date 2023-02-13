//
//  FuncStruct.swift
//  directorytestingTests
//
//  Created by Robert Steed on 1/3/23.
//

import Foundation
struct FuncStruct {
    
    static func evenNumbers(arr: [Int]) -> [Int] {
         return arr.filter({$0 % 2 == 0})
    }
    
    
}

