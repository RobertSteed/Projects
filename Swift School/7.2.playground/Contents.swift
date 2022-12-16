import UIKit

var greeting = "Hello, playground"



func average(_ array: [Int]) -> Int {
    let sumArray = array.reduce(0, +)
    let averageArray = sumArray / array.count
    return averageArray
    
}

var scores1 = [52, 90, 100, 97, 96, 92]
var scores = [70, 80, 91, 69, 42, 100]
average(scores)
average(scores1)

