import UIKit

var greeting = "Hello, playground"


func betterThanEveryoneElse(_ arr: [Int]) -> Bool {
    var average = arr.reduce(0.+) / arr.count
    if average >= 75 {
        return false
    } else {
        return true
    }
    
}





