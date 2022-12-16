import UIKit

var greeting = "Hello, playground"

func findMultiples(num: Int, higherNum: Int) -> [Int] {
    var multiples = [higherNum]
    for num in 0...higherNum {
        if(num.isMultiple(of: higherNum)) {
            multiples.append(num)
        }
    }
    return [higherNum]
}
findMultiples(num: 2, higherNum: 6)

