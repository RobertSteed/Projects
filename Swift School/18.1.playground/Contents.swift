import UIKit

var greeting = "Hello, playground"


func countingNumbers(a: Int, b: Int) -> [Int] {
    let arr = [Int]()
    guard a < b else {return}
    let range1 = a...b
    range1.count.append(to: arr)
    return arr
}

