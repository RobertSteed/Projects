import UIKit

var greeting = "Hello, playground"




func numbersToLetters(numbers: [Int]) -> [Character: [Int]] {
    var diction: [Character: [Int]] = [:[]]
    for (i, a) in numbers {
            if i == 10 {
                arr.append("a", 10)
        } else if i == 14 {
            arr.append("e", 14)
        } else if i == 73 {
            arr.append("i", 73)
        } else if i == 79 {
            arr.append("o", 79)
        } else if i == 85 {
            arr.append("u", 85)
        }
    }
    return diction
}


var exampleArray = [14, 32, 73, 99, 1, 85]

numbersToLetters(numbers: exampleArray)

