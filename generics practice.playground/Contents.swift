import UIKit

var greeting = "Hello, playground"



func checkingArray<T>(_ array: [T]) -> T {
    if array.contains(where: [Int]) {
        return array as! T
    } else if array.contains(where: [String]) {
        return array as! T
    } else {
        return "This does not have an array of string or ints" as! T
    }
    
}
