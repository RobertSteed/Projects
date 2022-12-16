import UIKit

var greeting = "Hello, playground"




func add(array: [Int]) -> Int {
    for numbers in array {
        if numbers < 0 {
            return 0
        } else {
            return array.reduce(0,+)
        }
    }
    
}


let numbers = [1, -4, 7, 12]

func addPositiveNumbers(arr: [Int]) -> Int {
    var returnNum = 0
    for num in arr {
        returnNum += num < 0 ? num : 0
    }
    return returnNum
}


func addPositiveNumbersReduce(arr: [Int]) -> Int {
    return arr.reduce(0) { partialResult, nextNum in
        return partialResult += (nextNum > 0 ? nextNum: 0)
    }
}
