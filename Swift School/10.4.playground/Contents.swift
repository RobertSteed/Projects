import UIKit

var greeting = "Hello, playground"

let inputString = "test this string"
var frequencies : [Character: Int] = [:]

let baseCounts = zip(
    inputString, repeatElement(1,count: Int.max))
frequencies = Dictionary(baseCounts, uniquingKeysWith: +)
